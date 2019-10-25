class Sip < ApplicationRecord
  validates :message, presence:true, length: { maximum: 100, minimum: 5 }

  belongs_to :user
  has_many :comments
end
