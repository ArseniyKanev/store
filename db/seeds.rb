10.times { Product.create(
  title: Faker::Commerce.product_name,
  description: Faker::Lorem.sentence,
  price: Faker::Commerce.price
)}
