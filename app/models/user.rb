class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                   uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_one :profile
  has_many :articles, dependent: :destroy
  has_many :likes
  has_many :like_this, through: :likes, source: :article
  has_many :stores
  has_many :store_this, through: :stores, source: :article

  
  def like(article)
    unless self == article
      self.likes.find_or_create_by(article_id: article.id)
    end
  end

  def dontlike(article)
    like = self.likes.find_by(article_id: article.id)
    like.destroy if like
  end

  def like?(article)
    self.like_this.include?(article)
  end
  
  
  def store(article)
    unless self == article
      self.stores.find_or_create_by(article_id: article.id)
    end
  end

  def dontstore(article)
    store = self.stores.find_by(article_id: article.id)
    store.destroy if store
  end

  def store?(article)
    self.store_this.include?(article)
  end
  
  def prepare_profile
    profile || build_profile
  end
  
  
end
