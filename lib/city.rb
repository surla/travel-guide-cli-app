class City
  attr_accessor :name,
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

  def doc
    @doc = Nokogiri::HTML(open("#{url}"))
  end

  def best_time_to_visit
    doc.css("p.article-tips__content").first.text
  end

  def transportation
    doc.css("p.article-tips__content")[1].text
  end

  def weather
    doc.css("p.article-tips__content")[2].text
  end

  def know_before_visiting
    doc.css("p.article-tips__content")[3].text.strip
  end

  def language
    doc.css("p.article-tips__content")[4].text
  end

  def electric
    doc.css("p.article-tips__content")[5].text
  end

  def currency
    doc.css("p.article-tips__content")[6].text
  end



end
