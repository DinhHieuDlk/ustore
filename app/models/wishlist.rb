class Wishlist < ActiveRecord::Base
  belongs_to :user
  has_many :wishlist_items,:dependent => :destroy
  has_many :products, :through => :wishlist_items
  
end
