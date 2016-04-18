class User < ActiveRecord::Base
  
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setting for OmniAuth Facebook integration
  devise :omniauthable, :omniauth_providers => [:facebook]

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

  # OmniAuth Method 1
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email          = auth.info.email
      user.password       = Devise.friendly_token[0,20]
      user.name           = auth.info.name   # assuming the user model has a name
      user.image          = auth.info.image # assuming the user model has an image
      user.fb_auth_token  = auth.credentials.token
      user.fb_expires_at  = Time.at( auth.credentials.expires_at )
      user.fb_expires     = auth.credentials.expires
    end
  end

  # OmniAuth Method 2
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
