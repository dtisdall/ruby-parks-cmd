require_relative 'basketball.rb'



# puts "This is the summary"
# puts bball.summary
# puts "This is the detail"


loop do
	print ">"
	input = gets.chomp

	case input.split(' ').first
	when "exit"
		exit
	when "amenity"
		case input.split(' ')[1]
		when "basketball"
			bball = Basketball.new(input.split(' ')[2])
			puts bball.detail
		end
	end
end

