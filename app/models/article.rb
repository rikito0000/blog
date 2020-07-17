class Article < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :title, presence: true, length: { maximum: 50 }
  
  belongs_to :user
  has_many :likes
  
   
  def like_count
    likes.count
  end
  
end
