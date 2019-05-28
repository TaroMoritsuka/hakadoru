class Shop < ApplicationRecord
  validates :shop_id, presence: true, length: { maximum: 255 }
  validates :name, length: { maximum: 255 }
  validates :name_kana, length: { maximum: 255 }
  validates :url, length: { maximum: 255 }
  validates :url_mobile, length: { maximum: 255 }
  validates :image_url, length: { maximum: 255 }
  validates :address, length: { maximum: 255 }
  validates :tel, length: { maximum: 255 }
  validates :opentime, length: { maximum: 255 }
  validates :holiday, length: { maximum: 255 }
  
  has_many :wants
  has_many :want_users, through: :wants, source: :user
  has_many :goods
  has_many :good_users, through: :goods, source: :user 
end
