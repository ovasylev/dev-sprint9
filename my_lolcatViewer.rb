require 'open-uri'
require 'nokogiri'

class LolcatViewer
	def run(count=1)
		doc = Nokogiri::HTML(open("http://www.lolcats.com/gallery/new.html"))
		links = doc.css('.gallery-item img').map do |link|
			{:title => link['alt'], :link => "http://www.lolcats.com#{link['src']}"}
		end
		
		count.times do
			rand_link_pos=rand(links.length-1)
			rand_img=links[rand_link_pos]
			puts "Title:#{rand_img[:title]} Link:#{rand_img[:link]}"
		end    
    end
end

cats=LolcatViewer.new
cats.run(3)

#Result:

#Title:CLOSEUP Link:http://www.lolcats.com/images/u/11/41/thumbs/lolcatsdotcomi198oekbcd4ebp1m.jpg
#Title:Found it! Another home for the dog! Link:http://www.lolcats.com/images/u/12/24/thumbs/lolcatsdotcom-found-it.jpg
#Title:The litter tray is empty again...  Link:http://www.lolcats.com/images/u/11/43/thumbs/lolcatsdotcomsyucc7vghgeu3ygu.jpg

