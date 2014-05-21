# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Team.delete_all
puts "\nReading teams.csv\n"
teams_file = File.read('db/seeds/teams.csv').force_encoding('UTF-8').encode('UTF-8')
puts "Parsing started...\n"
teams = CSV.parse(teams_file, headers: true, col_sep: ",", quote_char: '%')

teams.each do |team|
  Team.create(
      id: team['id'],
      name: team['name'],
      shortname: team['shortname'],
      image: team['image']
  )
  puts "Team: #{team['name']} created ok\n\r"
end


Pool.delete_all
puts "\nReading pools.csv\n"
pools_file = File.read('db/seeds/pools.csv').force_encoding('UTF-8').encode('UTF-8')
puts "Parsing started...\n"
pools = CSV.parse(pools_file, headers: true, col_sep: ",", quote_char: '%')

pools.each do |pool|
  Pool.create(
      id: pool['id'],
      name: pool['name']
  )
  puts "Pool: #{pool['name']} created ok\n\r"
end


Game.delete_all
puts "\nReading games.csv\n"
games_file = File.read('db/seeds/games.csv').force_encoding('UTF-8').encode('UTF-8')
puts "Parsing started...\n"
games = CSV.parse(games_file, headers: true, col_sep: ",", quote_char: '%')

games.each do |game|
  Time.zone = "UTC"
  Game.create(
      home_team_id: game['home_team_id'],
      visitor_team_id: game['visitor_team_id'],
      play_at: Time.parse("#{game['play_at']} UTC"),
      pool_id: game['pool_id']
  )
  puts "Game: #{game['name']} created ok\n\r"
end