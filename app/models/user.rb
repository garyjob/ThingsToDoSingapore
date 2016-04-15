class User < ActiveRecord::Base
  
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_associations, :dependent => :destroy
  has_many :events, through: :user_associations, source: :object, source_type: Event.name
  has_many :venues, through: :user_associations, source: :object, source_type: Venue.name
  has_many :attractions, through: :user_associations, source: :object, source_type: Attraction.name
  has_many :resources, through: :user_associations, source: :object, source_type: Resource.name

  # Returns an array of objects
  #   - events, venues, attractions
  #
  # Params:
  #   object_type:Sym
  #     - :events, 
  #     - :venues, 
  #     - :attractions
  #
  #   association_type:Sym
  #     - Examples UserAssociation.association_types
  #
  # Returns:
  #   ActiveRecord::AssociationRelation - Enumberable list of ActiveRecord results of one of the following types
  #     Event, Venue, Attraction
  #
  def get_objects( object_type, association_type )

    if self.method( object_type )
      query = self.send(object_type)
    else
      return []
    end

    if association_type
      query.where( user_associations: { association_type: association_type })
    else
      query
    end
    
  end

  def likes( object ) 
    ua = UserAssociation.find_or_create_by(
      user_id: self.id,
      object_id: object.id,
      object_type: object.class.name,
      association_type: UserAssociation.association_types[:likes]      
    )
    ua
  end

end
