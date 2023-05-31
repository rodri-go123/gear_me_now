# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Cleaning database..."
# Items.destroy_all
puts "Cleaning db"
Rental.destroy_all
Item.destroy_all
User.destroy_all

puts "Creating users"

alex = User.create({ first_name: "Alex", last_name: "Thaler", email: "alex@example.com", password: "123456" })
amanda = User.create({ first_name: "Amanda", last_name: "Sefu", email: "amanda@example.com", password: "123456" })
rodrigo = User.create({ first_name: "Rodrigo", last_name: "Cardoso", email: "rodrigo@example.com", password: "123456" })

puts User.all

puts "Finished!"

puts "Creating items"
items = [
  { user: rodrigo, name: "Ping Pong Racket", description: "Large face for increased tolerance, an oval grip for comfort and an aluminum frame for stability, the TR100 is the ideal racquet for beginners.", price: 15, image_url: "items/pingpong.jpg" },
  { user: amanda, name: "Baseball Kit", description: "Really nice baseball kit for beginners to intermediate players. Everything comes clean and well maintained. Enjoy your baseballing!", price: 150, image_url: "items/baseball.jpg" },
  { user: rodrigo, name: "Mountain Bike", description: "This bikepacking beast is ready to tackle the gnarliest trails all around the world. Book it for an unforgettable adventure.", price: 300, image_url: "items/mtb.jpg" },
  { user: amanda, name: "Stand-up paddle set", description: "Stand up paddling board, SUP board as an inflatable complete set, stand up paddle board with double PVC layering, optimal from 60 kg max 130 kg - 330 x 78 x 15 cm", price: 25, image_url: "items/paddle-board.jpg" },
  { user: alex, name: "Skateboard", description: "14 years old and have no friends? Hit the skate park with this beauty and impress everybody at your school. Book at your own risk.", price: 30, image_url: "items/skate.jpg" },
  { user: rodrigo, name: "Roller Blades", description: "90s fever? Seen too much Stranger Things lately? Go on a nostalgia trip and hit the roller disco with these bad boys. You will never be the same again.", price: 50, image_url: "items/rollerblades.jpg" },
  { user: amanda, name: "Folding Bike", description: "Want to be functional AND look like a hipster? This baby is perfect for you. It will take you anywhere, fold itself into a neat little half-bike and it is sure to make you stand out wherever you are.", price: 999, image_url: "items/folding-bike.jpg" },
  { user: alex, name: "Volleyball Ball", description: "White, spherical, can handle being thrown and loves the sand. Your ideal companion fo this summer season.", price: 20, image_url: "items/volleyball.jpg" },
  { user: rodrigo, name: "Basketball Hoop", description: "Bored of your career? Want to be like LeBron James? This basketball hoop is just for you.", price: 150, image_url: "items/basket-hoop.jpg" },
  { user: amanda, name: "Mountaneering Gear", description: "Humans are stupid. Say goodbye to society and go somewhere nice in the mountains knowing that you're kept safe by this items. Previous owner might have died.", price: 200, image_url: "items/climbing.jpg" }
]

items.each do |item|
  item = Item.create!(item)
  puts "Created #{item.name}"
end

puts "Finished!"
