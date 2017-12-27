class User < ApplicationRecord
  
  # validation
  validates :twitter_id, presence:true
  validates :nickname, presence:true
  
  #引数に関連するユーザーが存在すればそれを返し、存在しまければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
    
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:nickname]
    image_url = auth_hash[:image_url]
    
    User.find_or_create_by(provider: provider , uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
      user.save
    end
    
  end
end

