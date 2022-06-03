# frozen_string_literal: true

products = Product.create([{ title: 'Pizza1', body: 'Pizza with cheeze', price: '15' },
                           { title: 'Pizza2', body: 'Pizza with cheeze', price: '20' },
                           { title: 'Pizza3', body: 'Pizza with cheeze', price: '30' }])

users = User.create!(
  [
    { email: 'admin2@exemple.com', password: '123456', first_name: 'Вася', last_name: 'Печкин', phone: '123' },
    {  email: 'customer@exemple.com', password: '123456', first_name: 'Петя', last_name: 'Кусин', phone: '123' },
    {  email: 'manager@exemple.com', password: '123456', first_name: 'Гона', last_name: 'Тусин', phone: '123' }
  ]
)
users[0].add_role :admin
users[1].add_role :customer
users[2].add_role :manager

cart = Cart.create!

orders = Order.create!([
                         { user_id: users[1].id, address: '123 123 123' },
                         { user_id: users[1].id, address: '123 123 123' }
                       ])

LineItem.create!([
                   { product_id: products[1].id, cart_id: cart.id },
                   { product_id: products[2].id, cart_id: cart.id },
                   { product_id: products[1].id, order_id: orders[0].id },
                   { product_id: products[2].id, order_id: orders[0].id },
                   { product_id: products[1].id, order_id: orders[1].id },
                   { product_id: products[2].id, order_id: orders[1].id }
                 ])
