class User < ActiveRecord::Base
  has_many :user_roles  
  #accepts_nested_attributes_for :user_roles
  
  has_many :roles, through: :user_roles
  has_many :user_images
  accepts_nested_attributes_for :user_roles, :user_images
end
