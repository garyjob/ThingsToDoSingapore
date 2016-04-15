# require 'elasticsearch/model'

class Resource < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  has_many :category_associations, as: :object
  has_many :categories, through: :category_associations

  has_many :resource_associations, :dependent => :destroy
  has_many :events, through: :resource_associations, source: :object, source_type: Event.name
  has_many :venues, through: :resource_associations, source: :object, source_type: Venue.name
  has_many :attractions, through: :resource_associations, source: :object, source_type: Attraction.name


end