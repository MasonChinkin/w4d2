# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'byebug'

Cat.destroy_all
CatRentalRequest.destroy_all

1.upto(5) do |i|
    color = ['red','brown','black'].sample
    sex = ['M','F'].sample 
    
    c = Cat.create!(name: "name#{i}", 
        birth_date: i.years.ago, 
        color: color,
        sex: sex, 
        description: "description#{i}")

    r = CatRentalRequest.create!(cat_id: c.id,
    start_date: i.month.ago,
    end_date: i.month.from_now)
end

Cat.first.cat_rental_requests.create!(start_date: 1.month.ago,
    end_date: 1.month.from_now)
