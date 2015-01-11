require 'open-uri'
require 'json'


# QUESTIONS
# In example of "corner of Sheridan.." you had sensor=false at the end of your url, what is that?


# If you experience an error relating to SSL,
#   uncomment the following two lines:

# require 'openssl'
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

puts "What is the address you would like to find the latitude and longitude of?"


# Gets a string from the user and chomps off the carriage return at the end
the_address = gets.chomp

url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{the_address}"

# Replaces spaces and other URL-illegal characters in the string
url_safe_address = URI.encode(url)

# Your code goes below. Hints:

raw_data = open(url_safe_address).read
parsed_data = JSON.parse(raw_data)
the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"].to_f
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"].to_f

latitude = '%.6f' % the_latitude
longitude = '%.6f' % the_longitude


# Ultimately, we want the following line to work when uncommented:

puts "The latitude of #{the_address} is #{latitude} and the longitude is #{longitude}."





