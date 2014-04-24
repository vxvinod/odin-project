require 'rest-client'
url = gets.chomp
puts RestClient.post(url,"")