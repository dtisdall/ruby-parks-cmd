require 'open-uri'
require 'active_support'

class RunningTracks

	def initialize(park_id)
		@park_id = park_id
		@names = parse
	end

	def parse
		xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_RunningTracks_001.xml'))
		xml_obj["runningtracks"]["facility"].select{|item| item["Prop_ID"]["__content__"] == @park_id}.map{|found| found["Name"]["__content__"]}
	end

	def summary 
		"There are #{@names.length} running tracks."
	end

	def detail
		@names.join("\n")
	end

end