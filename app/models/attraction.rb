require 'elasticsearch/model'

class Attraction < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks  
end