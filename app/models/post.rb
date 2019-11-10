class Post < ApplicationRecord
  validates :caption, presence: true, length: { minimum: 3, maximum: 100 }
  validates :picture, presence: true
  
  mount_uploader :picture, PictureUploader

  belongs_to :user  
  belongs_to :beer

  has_many :comments, :dependent => :delete_all  
end
