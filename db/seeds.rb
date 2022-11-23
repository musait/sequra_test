# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.read(Rails.root.join('lib', 'merchants.csv'), headers: true).each do |row|
  merchant = Merchant.new(row.to_hash)

  unless merchant.save
    puts "Merchant not created: #{row.to_hash}"
    p merchant.errors.full_messages
  end

end

CSV.read(Rails.root.join('lib', 'shoppers.csv'), headers: true).each do |row|
  shopper = Shopper.new(row.to_hash)

  unless shopper.save
    puts "Shopper not created: #{row.to_hash}"
    p shopper.errors.full_messages
  end

end

CSV.read(Rails.root.join('lib', 'orders.csv'), headers: true).each do |row|
  order = Order.new(row.to_hash)

  unless order.save
    puts "Order not created: #{row.to_hash}"
    p order.errors.full_messages
  end

end