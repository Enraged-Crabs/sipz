class Beer < ApplicationRecord
  has_many :posts, :dependent => :delete_all
  belongs_to :user
end
