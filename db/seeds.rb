# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."
webmaster = User.create!(email: 'webmaster@gmail.com',firstname:"amine", lastname: "mghirbi",
            password:"123456", role:2, email_confirmed: true)
webmaster.update_attribute(:confirm_token, nil)

employee = User.create!(email: 'employee@gmail.com',firstname:"amine", lastname: "mghirbi",
             password:"123456", role:1, email_confirmed: true)
             employee.update_attribute(:confirm_token, nil)

client = User.create!(email: 'client@gmail.com',firstname:"amine", lastname: "mghirbi",
             password:"123456", role:0, email_confirmed: true)
client.update_attribute(:confirm_token, nil)
puts "Seeding done."