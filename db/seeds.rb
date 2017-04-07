# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Nutrient.destroy_all

Nutrient.create(name: "Protein", cal_per_gram: 4, percents: 30)
Nutrient.create(name: "Fat", cal_per_gram: 9, percents: 10)
Nutrient.create(name: "Carbohydrate", cal_per_gram: 4, percents: 60)
