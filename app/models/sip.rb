class Sip < ApplicationRecord
  validates :message, presence:true, length: { maximum: 100, minimum: 5 }
  validates :image, presence:true

  belongs_to :user
  has_many :comments
end
