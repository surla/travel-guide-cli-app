class CLI

  def initialize
    s = Scraper.new
    @cities = s.scrape_cities
  end

  def start
    puts ""
    puts "------ Welcome to this Travel Guide ------"
    puts ""

    input = ""

    while input != "Exit"
      puts "Where would you like to travel to?"
      puts "       Enter name of city or type list to see all cities."

      input = gets.split.map(&:capitalize).join(' ').strip

      case input
        when "List"
          list_cities
        when "Exit"
          puts ""
          puts "Have Fun Traveling!!!"
        else
          if find_by_name(input)
            city = find_by_name(input)
            list_city_details(city)
          else
            puts ""
            puts "No travel guide found"
            puts ""
            puts "Please try a different city."
          end
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
    puts "    #{city.name} Travel Information! "
    puts ""

    puts "------ Best Time To Visit #{city.name}------"
    puts ""
    puts "#{city.best_time_to_visit}"
    puts ""

    puts "------ Transportation ------"
    puts ""
    puts "#{city.transportation}"
    puts ""

    puts "------ #{city.name} Weather ------"
    puts ""
    puts "#{city.weather}"
    puts ""

    puts "------ Know Before Visiting ------"
    puts ""
    puts "#{city.know_before_visiting}"
    puts ""

    puts "------ Language ------"
    puts ""
    puts "#{city.language}"
    puts ""

    puts "------ Electric ------"
    puts ""
    puts "#{city.electric}"
    puts ""

    puts "------ Currency ------"
    puts ""
    puts "#{city.currency}"
    puts ""

    puts "     Have Fun Traveling!!!!"
    puts ""
  end
end
