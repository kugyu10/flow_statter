class User < ApplicationRecord
has_many :plans
has_many :email_users
has_many :participations

  # validation
  # validates :twitter_id, presence:true
   validates :nickname, presence:true


  #引数に関連するユーザーが存在すればそれを返し、存在しなければ新規に作成する
  def self.find_or_create_from_auth_hash(auth_hash)
    
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    provider = auth_hash[:provider]
    image_url = auth_hash[:info][:image]
    
    User.find_or_create_by(uid: uid, provider: provider) do |user|
      user.nickname = nickname
      user.image_url = image_url
    end
    
  end
  
  # fixture向け 渡された文字列のハッシュ値を返す
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


end

