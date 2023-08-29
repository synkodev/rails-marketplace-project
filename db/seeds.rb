# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds/01_sample_data.rb
require 'faker'

User.destroy_all



CATEGORIES = %w[
  Acessórios Agricultura Animais\ domésticos Alimentação Antiguidades Arte\ e\ Papelaria Beleza\ e\ Bem-estar Brinquedos
  Calçados Roupas Bolsas\ e\ Mochilas Ilícitos Câmeras Celulares Computadores Periféricos Gamer Casa Cama\ Mesa\ e\ Banho
  Móveis Esportes Ferramentas Festa Imóveis Jóias Saúde Serviços Adulto Criptomoeda Proibido\ em\ 78\ países Outros
]

10.times do
  User.create(
    address: Faker::Address.full_address,
    personal_id: "#{Faker::Number.unique.number(digits: 3)}-#{Faker::Number.unique.number(digits: 3)}-#{Faker::Number.unique.number(digits: 3)}-#{Faker::Number.unique.number(digits: 2)}",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: Faker::Gender.binary_type,
    phone_number: Faker::PhoneNumber.cell_phone,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
    terms_conditions: Faker::Boolean.boolean
  )
end


users = User.all

users_with_products_count = 20

users_with_products = users.sample(users_with_products_count)

users_with_products.each do |user|
  rand(0..10).times do
    user.products.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price(range: 1..1000),
      description: Faker::Lorem.sentence,
      category: CATEGORIES.sample
    )
  end
end
