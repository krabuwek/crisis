# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do 
  article = Article.new({title: "Иногда что-то там кот",
    published:true,
    content: "Иногда что-то там кот Иногда что-то там кот Иногда что-то там кот",
    user_id: 1,
    illustration:"Crisis_club_news_photo-5.jpg"})
  article.save
end