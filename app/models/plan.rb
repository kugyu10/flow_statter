class Plan < ApplicationRecord
  belongs_to :user
  has_many :participation
  mount_uploader :front_picture, PictureUploader
   
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1000}
  
  #独自バリデーション 画像サイズ上限 5MB
  validate :picture_size
  
  
  private
  
    def picture_size
      if front_picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
