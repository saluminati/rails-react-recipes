# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include HTTParty

@header = {'x-rapidapi-host'=> 'tasty.p.rapidapi.com', 'x-rapidapi-key'=> '44c6d1a668msh1517d3ce944e31fp15f2fcjsnc22e4e6022eb'}
@recipes = []



def fetch_recipes(index)
  results = HTTParty.get("https://tasty.p.rapidapi.com/recipes/list?tags=under_30_minutes&from=#{index}&sizes=#{index+20}", headers: @header)
  @recipes << results.parsed_response["results"].pluck("name")
end


(0..100).step(20) do |n|
  fetch_recipes(n)
end

puts @recipes