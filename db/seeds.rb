# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  Cat.destroy_all
  c1 = Cat.create!(birth_date: '2015/01/20', color: 'white', name: 'mittens', sex: 'F')  
  c2 = Cat.create!(birth_date: '2000/05/20', color: 'black', name: 'reuwhr', sex: 'M') 
  c3 = Cat.create!(birth_date: '2018/03/02', color: 'yellow', name: 'dashu', sex: 'F') 
  c4 = Cat.create!(birth_date: '2012/10/10', color: 'green', name: 'slime', sex: 'F') 
end 