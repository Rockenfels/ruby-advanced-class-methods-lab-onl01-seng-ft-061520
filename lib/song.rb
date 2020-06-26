class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    test = @@all.find_by_name(name)
    if test !== nil
      return test
    else
      song = create_by_name(name)
      return song
    end
  end
  
  def self.alphabetical
    @@all.sort_by {|a, b| a[0] <=> b[0]}
  end
  
  def new_from_filename(file_name)
    data = file_name.split("-")
    title = data[1].lstrip
    title = title.slice(0, title.length-4)
    artist = data[0]
    
    song = self.new_by_name(title)
    song.artist_name = artist
    
    song
  end
  
  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    @all << song
  end
  
  def self.destroy_all
    self.all.clear
  end

end
