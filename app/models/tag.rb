class Tag < ApplicationRecord
  belongs_to :book

  validates :tag, presence: true
end
