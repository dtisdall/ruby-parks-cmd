require 'open-uri'
require 'active_support'

class Playground

	def initialize(park_id)
		@park_id = park_id
		@names = parse
	end

	def parse
		xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_Playgrounds_001.xml'))
		xml_obj["playgrounds"]["facility"].select{|item| item["Prop_ID"]["__content__"] == @park_id}.map{|found| found["Name"]["__content__"]}
	end

	def summary 
		"There are #{@names.length} playgrounds."
	end

	def detail
		@names.join("\n")
	end

end