class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories
  has_many :products
  has_many :wishlists,:dependent => :destroy
  def self.wishlist_product product, current_user
  		current_wishlist=Wishlist.find_by(user_id: current_user)
  		if current_wishlist
  		current_wishlist.wishlist_items.where(product_id: product).first
  	end
  end
end
