require_relative 'basketball.rb'
require_relative 'playgrounds.rb'



# puts "This is the summary"
# puts bball.summary
# puts "This is the detail"

puts "Welcome to Prkly, the most 2.0 of all command line applications, now with extra XML\n\n"
puts "What is your postcode?\n"
postcode = gets.chomp
"\nLet me find some parks for you near #{postcode}\n"
5.times do 
	print '.'
	sleep(0.1)
end
