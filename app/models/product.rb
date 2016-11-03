class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :line_items
  has_many :wishlist_items
  has_attached_file :image, :styles => {:medium=> "195x247#",:thumb => "100x90>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		product_hash = row.to_hash
  		product = Product.where(name: product_hash["name"])
  		if product.count == 1
  			product.first.update_attributes(product_hash)
  		else
  			Product.create!(row.to_hash)
  		end
  	end
  end
end
