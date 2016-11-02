require 'open-uri'
require 'csv'
namespace :import do
  desc "add product"
  task product: :environment do
  	file_csv = Rails.root + "public/product.csv"
  	CSV.foreach(file_csv, headers: true) do |row|
  		Product.create!(name: row[0], category_id: row[1], description: row[2],price: row[3],user_id: row[4], image: row[5])
  	end

  end

end
