class CLI

  def initialize
    s = Scraper.new
    @cities = s.scrape_cities
  end

  def start
    input = ""
    while input != "exit"
      puts "Where would you like to travel to?"
      input = gets.strip
      binding.pry
    end
  end

  def list_cities
    City.all.each_with_index do |c, i|
      puts "#{i}. #{c.name}"
    end
  end

end
