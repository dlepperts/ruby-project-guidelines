require 'open-uri'
require 'net/http'

url = "https://www.nqttcn.com/featured-practitioners"
uri = URI.parse(url)
response = Net::HTTP.get_response(uri)
#puts response.body

require 'json'
JSON.parse(response.body)