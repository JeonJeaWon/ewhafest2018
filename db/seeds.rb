# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

# Ewha : id 1~77
CSV.foreach(Rails.root.join('db',"first_try.csv"), {headers: true, encoding: "UTF-8"}) do |row|
  Fest.create! row.to_hash
end

# #Kwangwoon : id 78~
# CSV.foreach(Rails.root.join('db',"KWU.csv"), {headers: true, encoding: "UTF-8"}) do |row|
#   Club.create! row.to_hash
# end

# CSV.foreach(Rails.root.join('db',"UNION.csv"), {headers: true, encoding: "UTF-8"}) do |row|
#   Club.create! row.to_hash
# end