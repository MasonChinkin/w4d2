# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'

Cat.destroy_all

5.times do |i|
    color = ['red','brown','black'].sample
    sex = ['M','F'].sample 
    
    c = Cat.create!(name: "name#{i}", 
        birth_date: i.years.ago, 
        color: color,
        sex: sex, 
        description: "description#{i}")
end