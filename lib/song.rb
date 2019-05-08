require 'pry'

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
    #song.name = @name
    @@all << song
    return song
  end
  
  def self.new_by_name(title)
    song = self.new 
    song.name = title
    #@@all << song
    return song
  end
  
  def self.create_by_name(title)
    song = self.new 
    song.name = title
    @@all << song
    return song
  end
  
  def self.find_by_name(title)
   @@all.find{|song| song.name == title}
  end 
  
  def self.find_or_create_by_name(title)
    ex_song = self.find_by_name(title)
    new_song = self.create_by_name(title)
    if self.find_by_name(title) == false
      self.create_by_name(title)
    end 
    self.find_by_name(title)
  end
  
  def self.alphabetical
    @@all.sort_by { |word| word.name }
  end
  
  def self.new_from_filename(filename)
    no_mp3 = filename.chomp('.mp3')
    song_array = no_mp3.split(' - ')
    #song = self.create_by_name(song_array[1])
    @name = song_array[1]
    @artist_name = song_array[0]
  end
  
  # def self.create_from_filename
    
  # end
  
  # def self.destroy_all
    
  # end
  
end
