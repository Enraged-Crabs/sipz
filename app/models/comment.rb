class Comment < ApplicationRecord
  validates :message, presence: true, length: { minimum: 3, maximum: 100 }
  
  belongs_to :user
  belongs_to :post  
end
