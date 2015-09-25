require 'open-uri'
require 'active_support'

class Concession

	def initialize(park_id)
		@park_id = park_id
		@names = parse
	end

	def parse
		xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_Concessions_001.xml'))
		xml_obj["root"]["concession"].select{|item| item["park_id"]["__content__"] == @park_id}.map{|found| found["Name"]["__content__"]}
	end

	def summary 
		"There are #{@names.length} concession areas."
	end

	def detail
		@names.join("\n")
	end

end