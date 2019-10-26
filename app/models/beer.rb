class Beer < ApplicationRecord
    belongs_to :user, optional: true
    has_many :posts
end
