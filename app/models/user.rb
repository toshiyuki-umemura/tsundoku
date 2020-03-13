class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :books
  has_many :comments

  validates :name,     presence: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 8 }

  # def self.find_for_oauth(auth)
  #   user = User.where(uid: auth.uid, provider: auth.provider).first

  #   unless user
  #     user = User.create(
  #       uid:      auth.uid,
  #       provider: auth.provider,
  #       name: auth.info.name,
  #       nickname: auth.info.nickname,
  #       email:    User.dummy_email(auth),
  #       password: Devise.friendly_token[0, 20]
  #     )
  #   end

  #   user
  # end

  # private

  # def self.dummy_email(auth)
  #   "#{auth.uid}-#{auth.provider}@example.com"
  # end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.info.name,
                         nickname: auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end

  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end


  def self.guest
    user = find_or_create_by!(name: "test", nickname: "guest_user", email: 'guest_user@examaple.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
