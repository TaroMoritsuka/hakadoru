class Shop < ApplicationRecord
  validates :shop_id, presence: true, length: { maximum: 255 }
  validates :name, presence: true, length: { maximum: 255 }
  validates :name_kaba, presence: true, length: { maximum: 255 }
  validates :url, presence: true, length: { maximum: 255 }
  validates :url_mobile, presence: true, length: { maximum: 255 }
  validates :image_url, presence: true, length: { maximum: 255 }
  validates :address, presence: true, length: { maximum: 255 }
  validates :tel, presence: true, length: { maximum: 255 }
  validates :opentime, presence: true, length: { maximum: 255 }
  validates :holiday, presence: true, length: { maximum: 255 }
  
  has_many :wants
  has_many :uers, through: :wants, source: :user
end
