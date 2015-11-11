require 'open-uri' #Installed by default, This library allows us to access differnt URL's from within the text editor
require 'nokogiri' #Not Installed by default: from Terminal, gem install nokogiri, This gem helps us read and search the HTML content of a webpage
require 'csv' #Installed by default, This library generates a CSV
require 'httpclient'

class NameScraper


def getNames(url,filename)

name = []
i = 0

#url = url + "#{i}"
loop do #scrape through multiple pages
	i += 1

	url =  url + "#{i}" #Save the URL in a variable called url
	html = open(url) #opens the url and assigns value to html
	page = Nokogiri::HTML(html) #parses variable html with NOKOgiri
	#puts page.class 
	page.css('a.profile-link').each do |line| #search for each profile name, 'a.profile-link' is a selector of the .css method, which is built into Nokogiri
		name << line.text	#Forces the extracted text in the html to name array
		#puts line.class 	
	end
	if page.css('a.profile-link').count == 0	#breaks loop count when there are no more pages to count
	   puts "break happened for #{i}"
	   break
	end	
end


CSV.open(filename, "w") do |file|  #generate CSV file 
  file << ["Listing Name"]
  		#puts file.class
  name.length.times do |j|
    file << [name[j]]
  end
end
#this is the return of the getNames method
name
end


def getUrls(url)
urls = []
i = 0


#url = url + "#{i}"
loop do #scrape through multiple pages
	i += 1

	url =  url + "#{i}" #Save the URL in a variable called url
	html = open(url) #opens the url and assigns value to html
	page = Nokogiri::HTML(html) #parses variable html with NOKOgiri
	#puts page.class 
	page.css('a.profile-link').each do |line| 
		urls << line['href']	#Forces the extracted text in the html to name array
		#puts line.class 	
	end
	if page.css('a.profile-link').count == 0	#breaks loop count when there are no more pages to count
	   puts "break happened for #{i}"
	   break
	end	
end
urls
end


def extractFileFromUrl(url,i)
	clnt=HTTPClient.new
	response = clnt.get(url)
	filename = "file#{i}.txt" 
	#there should no "/" signs in the filename otherwise ruby will assume its a path to a file vs the file name

	#File.new filename

	File.open(filename, 'w') do |f2|  
  	# use "\n" for two lines of text  
  	f2.puts response.content
	end  

	puts "done with file #{i}"
end	



end