# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
5.times do 
	categories =Category.create(name: Faker::Commerce.department, image: Faker::Avatar.image)
	@category = Category.all
end

10.times do
	@category.each do |index|
	products =Product.create(
		name: Faker::Commerce.product_name,
		price: Faker::Commerce.price,
		description: Faker::Lorem.paragraph,
		image: Faker::Avatar.image,
		category_id: index.id)
end
end
User.create!(email: 'dinhhieu.dlk@gmail.com', password: 'dinhhieu', password_confirmation: 'dinhhieu' ,admin: 'true')