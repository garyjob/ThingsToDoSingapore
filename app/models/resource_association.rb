class ResourceAssociation < ActiveRecord::Base
  belongs_to :resource
  belongs_to :object, polymorphic: true
end
