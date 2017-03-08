class CLI

  def initialize
    s = Scraper.new
    @cities = s.scrape_cities
  end

  def start
    input = ""

    while input != "exit"
      puts "Where would you like to travel to?"
      puts "Type list to see all cities"
      input = gets.strip

      case input
        when "list"
          list_cities
        when "exit"
          puts "Have Fun Traveling!!!!!"
        else
          city = find_by_name(input)
          list_city_details(city)

          puts "Enter another city:"
      end
    end
  end

  def list_cities
    City.all.each_with_index do |c, i|
      puts "#{i}. #{c.name}"
    end
  end

  def find_by_name(input)
    City.all.detect {|c| c.name == input}
  end

  def list_city_details(city)
    puts ""
    puts "    Traveling to #{city.name}!!!! "
    puts ""

    puts "------ Best Time To Visit ------"
    puts ""
    puts "#{city.best_time_to_visit}"
    puts ""

    puts "------ #{city.name} Transportation ------"
    puts ""
    puts "#{city.transportation}"
    puts ""

    puts "------ #{city.name} Weather ------"
    puts ""
    puts "#{city.weather}"
    puts ""

    puts "------ #{city.name} Know Before Visiting ------"
    puts ""
    puts "#{city.know_before_visiting}"
    puts ""

    puts "------ #{city.name} Language ------"
    puts ""
    puts "#{city.language}"
    puts ""

    puts "------ #{city.name} Electric ------"
    puts ""
    puts "#{city.electric}"
    puts ""

    puts "------ #{city.name} Currency ------"
    puts ""
    puts "#{city.currency}"
    puts ""

    puts "     Have Fun Traveling!!!!"
  end
end
