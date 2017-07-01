
#
Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                  cost: Faker::Number.between(1, 100),
                  country: Faker::LordOfTheRings.location)
end

p "Created #{Product.count} products"

Review.destroy_all

250.times do |index|
  Review.create!(
               author: Faker::Name.name ,
               content_body: Faker::Lorem.character(100),
               rating: Faker::Number.between(1, 5),
               product_id: Faker::Number.between(1, 50)
            )
end

p "Created #{Review.count} review"
