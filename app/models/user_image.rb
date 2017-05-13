class UserImage < ActiveRecord::Base
  
  belongs_to :user
  
  has_attached_file :image, :styles => { thumbnail: '90x90', small: '150x150!', normal: '480x1242', large: '816x1242' }
  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :image_content_type, presence: true
  validates_uniqueness_of :image_content_type, scope: [:user_id]
  validates_uniqueness_of :image_content_type, scope: [:user_id]
  
end
