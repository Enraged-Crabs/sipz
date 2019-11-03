class Post < ApplicationRecord
  validates :caption, presence: true, length: { maximum: 100, minimum: 3 }
  belongs_to :user
  has_many :comments
  belongs_to :beer
end
