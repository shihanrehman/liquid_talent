require 'open-uri' #Installed by default, This library allows us to access differnt URL's from within the text editor
require 'nokogiri' #Not Installed by default: from Terminal, gem install nokogiri, This gem helps us read and search the HTML content of a webpage
require 'csv' #Installed by default, This library generates a CSV

name = []
i = 0
loop do #scrape through multiple pages
	i += 1
	url = "https://angel.co/people?tag_ids%5B%5D=1664&tag_ids%5B%5D=82532&page=#{i}" #Save the URL in a variable called url
	html = open(url)
	page = Nokogiri::HTML(html)
	puts page.class
	page.css('a.profile-link').each do |line|
		name << line.text
		puts line.class 	
	end
	if page.css('a.profile-link').count == 0
		break
	end
end


CSV.open("angel_listings.csv", "w") do |file|  #generate CSV file
  file << ["Listing Name"]

  name.length.times do |i|
    file << [name[i]]
  end
end


