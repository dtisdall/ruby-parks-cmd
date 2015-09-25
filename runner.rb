require_relative 'basketball.rb'
require_relative 'playgrounds.rb'
require_relative 'parks.rb'
require_relative 'running_tracks.rb'



# puts "This is the summary"
# puts bball.summary
# puts "This is the detail"

puts "\n\n\nWelcome to Prkly, the most 2.0 of all command line applications, now with extra XML\n\n"
puts "What is your postcode?\n"
postcode = gets.chomp
"\nLet me find some parks for you near #{postcode}\n"
5.times do 
	print '.'
	sleep(0.1)
end
puts "."
park = Parks.new(postcode)
puts "\nHere are your parks. " + park.summary
puts park.detail
puts "\nWhich park would you like to know about?\n"
selected_park = gets.chomp.upcase
puts "\nLet me get details for #{selected_park}\n"
5.times do 
	print '.'
	sleep(0.1)
end
puts "\nThis is what this park has:\n\n"
bball = Basketball.new(selected_park)
pground = Playground.new(selected_park)
rtrack = RunningTracks.new(selected_park)
puts "1. #{bball.summary}"
puts "2. #{pground.summary}"
puts "3. #{rtrack.summary}"
puts "\nWhich amenity would you like to know about?\n\n"
amenity = gets.chomp
case amenity
when "1"
	puts bball.detail
when "2"
	puts pground.detail
when "3"
	puts rtrack.detail
else
	puts "I pity the fool [who can't select an amenity]"
end
