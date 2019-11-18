class Beer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :picture, presence: true
  
  mount_uploader :picture, PictureUploader

  belongs_to :user

  has_many :posts, :dependent => :delete_all

  def self.search(search)
	if search
	  find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
	  order('RANDOM()').all
	end
  end
end