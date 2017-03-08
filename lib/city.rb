class City
  attr_accessor :name,
                  :url,
                  :best_time_to_visit,
                  :transportation,
                  :weather,
                  :know_before_visting,
                  :language,
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



end
