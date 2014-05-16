require 'crack'
require 'rest-client'
def dothegeocode(addr)
    parsed_xml = Crack::XML.parse(RestClient.get("http://maps.googleapis.com/maps/api/geocode/xml?address=1400+Broadway,+New+York,+NY&sensor=false"))
    xml = parsed_xml["GeocodeResponse"]["result"]["geometry"]["location"]["lng"]
    puts xml
end
dothegeocode("London")
