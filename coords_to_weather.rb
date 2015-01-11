require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE


puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

url = "https://api.forecast.io/forecast/d62f0a592994b78850dff50ecac53d84/#{the_latitude},#{the_longitude}"

raw_data = open(url).read
parse_data = JSON.parse(raw_data)

the_temperature = parse_data["currently"]["temperature"]
the_hour_outlook = parse_data["minutely"]["summary"]
the_day_outlook = parse_data["daily"]["data"][0]["summary"]


puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
