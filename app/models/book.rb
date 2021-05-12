class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
end
