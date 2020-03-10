class Tag < ApplicationRecord
  belongs_to :book

  validates :tag, presence: true, length: { maximum: 10 }
end
