class Plan < ApplicationRecord
  belongs_to :user
  has_many :participation
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 1000}
end
