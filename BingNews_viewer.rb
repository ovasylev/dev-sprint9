require 'open-uri'
require 'nokogiri'

class BingNewsViewer
	def run
		doc = Nokogiri::HTML(open("http://www.bing.com/news?q=local%20news&form=NWRFSH"))
		doc.css('.newstitle a').map.each do |link|
			puts "Title:#{link.content} \n Link:#{link['href']} \n\n"
		end
		nil
	end
end


news=BingNewsViewer.new
news.run


#Part of a Result:

#Title:13th Cookie
# Link:http://portland.thephoenix.com/thebest/portland/2010/food/cookie/

#Title:A major Maine — and national — mystery
# Link:http://portland.thephoenix.com/news/155248-major-maine-and-national-mystery/

#Title:Ozone outrage
# Link:http://thephoenix.com/Boston/news/155051-ozone-outrage/

#Title:Pan-Mass winner
# Link:http://www.thesomervillenews.com/archives/41313

#...
