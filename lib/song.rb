class Song 
  # extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
 
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
    end
  
  def self.all
    @@all 
  end
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save 
    if @artist != nil
      @artist.songs << new_song
    end
    new_song
  end
  
  ##def artist=(artist)
  ##  @artist = artist
   ## @artist.songs << self
  ##end
## MK version
  
    def artist=(artist)
    if @artist == nil
      @artist = artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
  ## ONLINE version
  
  def genre=(genre)
    if @genre == nil
      @genre = genre
    end
    if self.genre != nil
      genre.songs << self unless genre.songs.include?(self)
    end
    @genre
  end
    
end