# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.create!(firstname: "Alex", lastname: "Pushkin")
Author.create!(firstname: "Leo", lastname: "Tolstoy")
Author.create!(firstname: "Sergey", lastname: "Esenin")

Category.create!(title: "triller")
Category.create!(title: "novel")
Category.create!(title: "best-seller")

Book.create(title: "War and Pease", short_description: "short description",
            description: "description", picture: "(some picture)", in_stock: "true",
            price: 14.90)

Book.create(title: "Ruslan and Ludmila", short_description: "short description",
            description: "description", picture: "(some picture)", in_stock: "true",
            price: 20.99)

Delivery.create(text: "UPS Ground $", price: 5.00)
Delivery.create(text: "UPS One day $", price: 15.00)
Delivery.create(text: "UPS Two days $", price: 10.00)

Country.create(name: "USA")
Country.create(name: "Canada")
Country.create(name: "England")
