class CategoryAssociation < ActiveRecord::Base
  belongs_to :category
  belongs_to :object, polymorphic: true  
end
