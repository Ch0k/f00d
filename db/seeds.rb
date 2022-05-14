# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
products = Product.create([{ title: "Pizza1" , body: "Pizza with cheeze", price: "15"},
          { title: "Pizza2", body: "Pizza with cheeze", price: "20" },
        { title: "Pizza3", body: "Pizza with cheeze", price: "30" }])
