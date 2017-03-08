def city
  attr_accessor :name, :url

  @@all = []

  def intialize(name, url)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end


end
