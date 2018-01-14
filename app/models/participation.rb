class Participation < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  
  
  validates :user_id, presence:true
  validates :plan_id, presence:true
end
