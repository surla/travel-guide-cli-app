require 'open-uri'

class Scraper
  def doc
    @doc = Nokogiri::HTML(open("http://www.travelandleisure.com/travel-guide"))
  end

  def scrape_cities
    doc.css("div.grid__item div.grid__item__details").each do |city|
      name = city.css(".grid__item__title").text
      url = "http://www.travelandleisure.com/travel-guide/#{name}"
      City.new(name, url)
    end
  end

end
