class MusicImporter 
  
  def initialize(path)
    @path = path
  end
  
  def path 
    @path 
  end
  
  def files 
    @files = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
  end
  
  def import 
    files.each {|song| Song.create_from_filename(song)}
  end 
  
end 

# test = MusicImporter.new("../spec/fixtures/mp3s")
# puts test.files
# test.import
# puts Song.all

# MusicImporter.import