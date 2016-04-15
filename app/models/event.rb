# require 'elasticsearch/model'

class Event < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  has_many :resource_associations, as: :object
  has_many :resources, through: :resource_associations

  has_many :category_associations, as: :object
  has_many :categories, through: :category_associations

end