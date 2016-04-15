class UserAssociation < ActiveRecord::Base
  belongs_to :user
  belongs_to :object, polymorphic: true  

  # Possible list of association types between User and Objects within the system
  enum association_type: [
    :default,
    :owns,
    :likes,
    :attending,
    :visited,
    :manages
  ]
end
