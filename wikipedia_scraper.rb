require 'open-uri' #Installed by default, This gem allows us to access differnt URL's from within the text editor
require 'nokogiri' #Not Installed by default: from Terminal, gem install nokogiri, This gem helps us read and search the HTML content of a webpage

url = "https://angel.co/jobs" #Save the URL in a variable called url
page = Nokogiri::HTML(open(url))  #Open url and scan through the content of the webpage with Nokogiri; the content of the HTML in stored in 'page' variable

puts page #Display html in Terminal