# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed data for items

items = [
  { id: 9, title: "Velvet Banana", description: "Banane en velours marron", price: 40.0, image_url: "/assets/ban_marron-1f297380e1988cc654727676638e253bdeac3f599ca9e4a1d5b163217e45b9c1.JPG", created_at: "2024-05-27 14:15:22.722965", updated_at: "2024-05-27 14:15:22.722965" },
  { id: 10, title: "Yellow Wax Banana", description: "Banane imprimée wax jaune", price: 40.0, image_url: "/assets/ban_wax-dea5a56beb517413782f269be5db183b3be79a94253e145ae38ab4b29bfe57a4.JPG", created_at: "2024-05-27 14:16:19.670178", updated_at: "2024-05-27 14:16:19.670178" },
  { id: 11, title: "Blue Wax Banana", description: "Banane imprimée wax bleu", price: 40.0, image_url: "/assets/ban_wax_2-7193e3f673de4f75c834100a31172dea5a3853860761190d5327f6a76c5cd44e.JPG", created_at: "2024-05-27 14:17:29.830254", updated_at: "2024-05-27 14:17:29.830254" },
  { id: 12, title: "Orange Wax Banana", description: "Banane imprimée wax orange", price: 40.0, image_url: "/assets/ban_wax_3-7d989ba272aaeb684c77df851c6f2a277b73adb35e31d6c9ee77902b6d750e96.JPG", created_at: "2024-05-27 14:18:14.874688", updated_at: "2024-05-27 14:18:14.874688" },
  { id: 13, title: "Flower Power", description: "Bob en velours imprimé fleurs esprit 70's", price: 30.0, image_url: "/assets/bob_fleurs-74e6680467cce9e99df5a6dac8a104c8d7e324eee845b414e39aad492900c5df.JPG", created_at: "2024-05-27 14:04:34.118514", updated_at: "2024-05-27 14:20:01.292774" },
  { id: 14, title: "Red Alert", description: "Bob en toile de coton rouge", price: 30.0, image_url: "/assets/bob_rouge-08310d939c67db6d557a90081151ce0b1c311771d4e8fbd18ff26266372b134e.JPG", created_at: "2024-05-27 14:06:32.175656", updated_at: "2024-05-27 14:20:25.921862" },
  { id: 15, title: "Hello Camo", description: "Bob en toile de coton imprimé camouflage", price: 30.0, image_url: "/assets/bob_camou-f2dfc0d803392fdb5484ad08a29daee18a85e38eab1883e66e6d7118efaebbc3.JPG", created_at: "2024-05-27 14:07:26.388571", updated_at: "2024-05-27 14:20:39.908567" },
  { id: 16, title: "Blue Wax", description: "Bob en toile de coton bleue, doublé wax", price: 30.0, image_url: "/assets/bob_wax-8d47a254466d1d35288c85659be9708a2fec2da13f1c2a1edc7753526e4d5764.JPG", created_at: "2024-05-27 14:08:52.309608", updated_at: "2024-05-27 14:20:52.721763" }
]

items.each do |item|
  Item.create!(item)
end
