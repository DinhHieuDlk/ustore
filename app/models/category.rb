class Category < ActiveRecord::Base
  belongs_to :user
  has_many :products
  has_attached_file :image, :styles => {:thumb => "270x120#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
