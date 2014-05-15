require 'csv'
require 'sunlight/congress'

Sunlight::Congress.api_key="69c6254c15cb47779b4bcaedb19666f4"


def clean_zipcode(zipcode)
	if zipcode.nil?
		"00000"
	elsif zipcode.length<5
		zipcode.to_s.rjust(5,"0")
	elsif zipcode.length>5
		zipcode[0..4]
	else
		zipcode
	end
	
end

def simple_clean_zipcode(zipcode)
	zipcode.to_s.rjust(5,"0")[0..4]
end

puts "Event manager initialized"
contents=CSV.open "event_attendees.csv", headers: true,header_converters: :symbol
contents.each do |line|
	name = line[:first_name]
	zipcode = simple_clean_zipcode(line[:zipcode])
	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
	puts "#{name}--#{zipcode}----#{legislators}"
end

#69c6254c15cb47779b4bcaedb19666f4