# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

users = [
  {
    username: "joaozinho",
    password: "123456",
    messages: [
      {
        body: "Bom dia!"
      }
    ]
  },
  {
    username: "mariazinha",
    password: "123456",
    messages: [
      {
        body: "Bom dia, Joãozinho!"
      }
    ]
  },
  {
    username: "fulanildo",
    password: "123456",
    messages: [
      {
        body: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit magni excepturi ea voluptatum architecto repellat. Autem suscipit officia at eum ad dolorem iste, qui voluptates nesciunt dolores doloremque esse! Itaque."
      }
    ]
  }
]

users.each do |user|
  User.create!(user)
end
