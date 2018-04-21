class Plan < ApplicationRecord
  belongs_to :user
  has_many :participation
  mount_uploader :front_picture, PictureUploader
   
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1000}
end
