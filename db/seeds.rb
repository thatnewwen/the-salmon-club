# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:"Alex Wen", username:"thatnewwen", email:"alex@alex.com", password:"123456", admin: true)

Article.create(title:"North Korea and the Western Gaze", content:"Here is some text.", author_id: 1, tag_id: 1)

Article.create(title:"The Politics of Borders", content:"Here is some text.", author_id: 1, tag_id: 1)

Tag.create(name:"Politics")

Category.create(tag_id: 1, article_id: 1)
Category.create(tag_id: 1, article_id: 2)