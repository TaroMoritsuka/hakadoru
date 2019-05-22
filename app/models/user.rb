class User < ApplicationRecord
  before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :wants
    has_many :shops, through: :wants
    has_many :want_shops, through: :wants, source: :shop
    has_many :goods
    has_many :shops, through: :goods
    has_many :good_shops, through: :goods, source: :shop
    
  def want(shop)
    self.wants.find_or_create_by(shop_id: shop.id)
  end

  def unwant(shop)
    want = self.wants.find_by(shop_id: shop.id)
    want.destroy if want
  end

  def want?(shop)
    self.want_shops.include?(shop)
  end
  
  def good(shop)
    self.goods.find_or_create_by(shop_id: shop.id)
  end
  
  def ungood(shop)
    good = self.goods.find_by(shop_id: shop.id)
    good.destroy if good
  end
  
  def good?(shop)
    self.good_shops.include?(shop)
  end
end


 