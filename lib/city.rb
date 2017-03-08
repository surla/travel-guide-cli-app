class City
  attr_reader :name,
                  :url,
                  :best_time_to_visit,
                  :transportation,
                  :weather,
                  :know_before_visiting,
                  :language,
                  :electric,
                  :currency

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def best_time_to_visit
    details.first.text
  end

  def transportation
    details[1].text
  end

  def weather
    details[2].text
  end

  def know_before_visiting
    details[3].text.strip
  end

  def language
    details[4].text
  end

  def electric
    details[5].text
  end

  def currency
    details[6].text
  end

  private
    def doc
      @doc = Nokogiri::HTML(open("#{url}"))
    end

    def details
      doc.css("p.article-tips__content")
    end

end
