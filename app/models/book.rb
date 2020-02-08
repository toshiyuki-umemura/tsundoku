class Book < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :tags
  accepts_nested_attributes_for :tags
end
