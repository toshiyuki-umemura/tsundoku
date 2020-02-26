class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments

  validates :name,     presence: true
  validates :nickname, presence: true, uniqueness: true

  def self.guest
    user = find_or_create_by!(name: "test", nickname: "guest_user", email: 'guest_user@examaple.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
