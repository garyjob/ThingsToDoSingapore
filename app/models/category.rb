class Category < ActiveRecord::Base

  has_many :category_associations, :dependent => :destroy
  has_many :events, through: :category_associations, source: :object, source_type: Event.name
  has_many :venues, through: :category_associations, source: :object, source_type: Venue.name
  has_many :attractions, through: :category_associations, source: :object, source_type: Attraction.name  
  has_many :resources, through: :category_associations, source: :object, source_type: Resource.name  
end
