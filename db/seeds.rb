# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.destroy_all
User.destroy_all

daytrachan = User.create!(email: "daytrachan@example.com", password: "daytra")
techn = User.create!(email: "techn@example.com", password: "raisetech")

5.times do
  daytrachan.articles.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 15)
  )
end  # ← ここで daytrachan のブロックを閉じる

5.times do
  techn.articles.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 15)
  )
end  # ← ここで techn のブロックを閉じる