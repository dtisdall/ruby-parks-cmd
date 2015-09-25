require 'open-uri'
require 'active_support'

class Parks

  attr_reader :names

  def initialize(zip_code)
    @zip_code = zip_code
    @names = parse
  end

  def parse
    xml_obj = ActiveSupport::XmlMini.parse(open('http://www.nycgovparks.org/bigapps/DPR_Parks_001.xml'))

    xml_obj["parks"]["facility"].select { |park| park['Zip']['__content__'].to_s.include? @zip_code.to_s }.map { |park| "#{park['Prop_ID']['__content__']}: #{park['Name']['__content__']}" }
  end

  def summary
    "There are #{@names.length} parks near you."
  end

  def detail
    @names.join("\n")
  end

end


