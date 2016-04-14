require 'elasticsearch/model'

class Venue < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks    
end