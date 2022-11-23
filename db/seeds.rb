# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'csv'

# CSV.read(Rails.root.join('lib', 'merchants.csv'), headers: true).each do |row|
# binding.pry
#   merchant = Merchant.new(row.to_hash)

#   unless merchant.save
#     puts "Merchant not created: #{row.to_hash}"
#     p merchant.errors.full_messages
#   end

# end