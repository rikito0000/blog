class Article < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  
  
  
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :stores, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  mount_uploader :img, ImgUploader
   
  def like_count
    likes.count
  end
  
  def store_count
    stores.count
  end
  
end
