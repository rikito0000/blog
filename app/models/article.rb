class Article < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 100 }
  belongs_to :user
end
