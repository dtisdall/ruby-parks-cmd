require 'open-uri'
require 'active_support'
puts "which park do you want?"
request = gets.chomp

xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_Basketball_001.xml'))

xml_obj["basketball"]["facility"].select{|item| item["Prop_ID"]["__content__"] == request}.each{|found| puts found["Name"]["__content__"]}