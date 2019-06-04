class MusicImporter 
  
  def initialize(path)
    @path = path
  end
  
  def path 
    @path 
  end
  
  def files 
    @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    puts @files
  end
  
  def self.import 
    @files.each {|song| Song.create_from_filename(song)}
  end 
  
end 