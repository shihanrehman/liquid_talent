require 'open-uri'
require 'nokogiri'
require 'csv'

url = "https://www.airbnb.com/s/Brooklyn--New-York--NY"
page = Nokogiri::HTML(open(url))

#Store data in arrays
name = []
page.css('h3.h5.listing-name.text-truncate').each do |line|
	name << line.text.strip
end

price = []
page.css('span.h3.text-contrast').each do |line|
	price << line.text
end

details = []
page.css('a.text-normal.link-reset').each do |line|
	details << line.text.strip
end

#Write data to CSV file
CSV.open("airbnb_listings.csv", "w") do |file|
  file << ["Listing Name", "Price", "Room Type"]

  name.length.times do |i|
    file << [name[i], price[i], details[i]]
  end
end