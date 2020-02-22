class Book < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags

  validates :title,   presence: true
  validates :content, presence: true
end