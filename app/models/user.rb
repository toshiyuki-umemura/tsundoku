class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :books, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name,     presence: true
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 8 }

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        name: auth.info.name,
        nickname: auth.info.nickname,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end



  def self.guest
    user = find_or_create_by!(name: "test", nickname: "guest_user", email: 'guest_user@examaple.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
