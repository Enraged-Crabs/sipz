class Beer < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :posts, :dependent => :delete_all
  belongs_to :user
end
