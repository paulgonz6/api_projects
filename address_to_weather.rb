require 'open-uri'
require 'json'

# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp

# CREATES URL TO CALL FOR ADDRESS SEARCH
address_url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{the_address}"
address_url_safe = URI.encode(address_url)

# PARSES DATA and FINDS LAT and LONG
raw_data_address = open(address_url_safe).read
parsed_data_address = JSON.parse(raw_data_address)

the_latitude = parsed_data_address["results"][0]["geometry"]["location"]["lat"].to_f
the_longitude = parsed_data_address["results"][0]["geometry"]["location"]["lng"].to_f

# CREATES URL TO CALL FOR WEATHER SEARCH
weather_url = "https://api.forecast.io/forecast/d62f0a592994b78850dff50ecac53d84/#{the_latitude},#{the_longitude}"
weather_url_safe = URI.encode(weather_url)

# PARSES RAW WEATHER DATA AND FINDS FORECASTS
raw_data_weather = open(weather_url_safe).read
parsed_data_weather = JSON.parse(raw_data_weather)

the_temperature = parsed_data_weather["currently"]["temperature"]
the_hour_outlook = parsed_data_weather["minutely"]["summary"]
the_day_outlook = parsed_data_weather["daily"]["data"][0]["summary"]

# Your code goes below.

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"
