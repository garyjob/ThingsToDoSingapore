# require 'elasticsearch/model'

class Venue < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  has_many :resource_associations, as: :object
  has_many :resources, through: :resource_associations
end