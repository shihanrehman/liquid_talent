load 'namescraper.rb' 
#require NameScraper

ns = NameScraper.new() #

#result = ns.getNames("https://angel.co/people?tag_ids%5B%5D=1664&tag_ids%5B%5D=82532&page=","angel_listings_namescraper.csv")

listOfUrls = ns.getUrls("https://angel.co/people?tag_ids%5B%5D=1664&tag_ids%5B%5D=82532&page=")



puts Dir.pwd
i = 0
for url in listOfUrls
	i = i + 1
	ns.extractFileFromUrl(url,i)
end







