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

tennis_racket = { user: rodrigo, name: "tennis racket", description: "Large face for increased tolerance, an oval grip for comfort and an aluminum frame for stability, the TR100 is the ideal racquet for beginners.", price: 15, image_url: "https://contents.mediadecathlon.com/p2355088/k$6864d6c9304d4e16ada08b325013a397/sq/tenniss[…]at-pure-aero-300-g.jpg?format=auto&f=646x646&quality=40" }
stand_up_paddle_set = { user: amanda, name: " Stand-up paddle set ", description: "Stand up paddling board, SUP board as an inflatable complete set, stand up paddle board with double PVC layering, optimal from 60 kg max 130 kg - 330 x 78 x 15 cm", price: 25, image_url: "https://contents.mediadecathlon.com/m6871966/k$b0be7007c02eac2b03c7055f41dd2844/sq/suprfit-stand-up-paddling-board-als-aufblasbares-sup-board-set-halia-whiteorange.jpg?format=auto&f=646x646&quality=40" }
climbing_harness = { user: alex, name: "Climbing harness", description: "comfortable and versatile climbing harness for a wide variety of uses. Comfort frame construction made of EVA and 3D mesh, 4 buckles for adjustment and 4 gear loops, this harness is perfect for many different climbing adventures", price: 20, image_url: "https://contents.mediadecathlon.com/p1332473/k$5fe056d91b54054daaf113315123ee1a/sq/klettergurt-rock-erwachsene-schwarz-grau.jpg?f=3000x3000" }
table_tennis_table_outdoor = { user: rodrigo, name: "Table-tennis ", description: "The weatherproof plate is perfect for outdoor use and offers you a wonderful gaming experience. Thanks to the quick setup, you can get started right away and put your skills to the test.", price: 75, image_url: "https://contents.mediadecathlon.com/p2272561/k$d08780fabfc81791e18a9f61b925a297/sq/tischtennisplatte-outdoor-ppt-5002-blau.jpg?f=3000x3000" }

[tennis_racket, stand_up_paddle_set, climbing_harness, table_tennis_table_outdoor].each do |item|
  item = Item.create!(item)
  puts "Created #{item.name}"
end

puts "Finished!"
