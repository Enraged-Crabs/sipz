class Post < ApplicationRecord
    validates :message, presence: true
    belongs_to :user
    has_many :comments
    belongs_to :beer
end
