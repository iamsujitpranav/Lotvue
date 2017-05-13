class Role < ActiveRecord::Base
  
  has_many :user_roles
  
  scope :active, -> { where(active: true)}
end
