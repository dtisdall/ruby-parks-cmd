require 'open-uri'
require 'active_support'

class Basketball

	def initialize(park_id)
		@park_id = park_id
		@names = parse
	end

	def parse
		xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_Basketball_001.xml'))
		xml_obj["basketball"]["facility"].select{|item| item["Prop_ID"]["__content__"] == @park_id}.map{|found| found["Name"]["__content__"]}
	end

	def summary 
		"There are #{@names.length} basketball courts."
	end

	def detail
		@names.join("\n")
	end

end