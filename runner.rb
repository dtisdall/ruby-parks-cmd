require_relative 'basketball.rb'
require_relative 'playgrounds.rb'
require_relative 'parks.rb'
require_relative 'running_tracks.rb'
require_relative 'concessions.rb'



# puts "This is the summary"
# puts bball.summary
# puts "This is the detail"
puts "\e[H\e[2J"
puts "Welcome to Prkly, the most 2.0 of all command line applications, now with extra XML\n\n"
puts "What is your zip code?\n"
postcode = gets.chomp
"\nLet me find some parks for you near #{postcode}\n"
5.times do
	print '.'
	sleep(0.1)
end
puts "."
park = Parks.new(postcode)
if park.names.empty?
  puts "\e[H\e[2J"
  puts "No parks found for #{postcode}. Make sure you enter a zip code that's in New York City."
  exit
else
  puts "\e[H\e[2J"
  puts park.summary
  puts
  puts park.detail
end
puts "\nWhich of these parks would you like to know more about? Enter a park ID to learn more.\n"
selected_park = gets.chomp.upcase
puts "\nLet me get details for #{selected_park}\n"
5.times do
	print '.'
	sleep(0.1)
end
puts "\nHere is what that park has to offer:\n\n"
bball = Basketball.new(selected_park)
pground = Playground.new(selected_park)
rtrack = RunningTracks.new(selected_park)
conc = Concession.new(selected_park)
puts "1. #{bball.summary}"
puts "2. #{pground.summary}"
puts "3. #{rtrack.summary}"
puts "4. #{conc.summary}"
puts "\nWhich of these amenities would you like to know about? Enter a number.\n\n"
amenity = gets.chomp
case amenity
when "1"
	puts bball.detail
when "2"
	puts pground.detail
when "3"
	puts rtrack.detail
when "4"
	puts conc.detail
else
	puts "I pity the fool [who can't select an amenity]"
end
