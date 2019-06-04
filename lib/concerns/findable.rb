module Concerns::Findable
  
      def self.find_by_name(name)
        self.all.detect {|x| x.name == name}
      end 
  ## iterate through all array and return first value where condition is true
  
  
      def self.find_or_create_by_name(name)
        if self.find_by_name(name)
        else 
        self.create(name)
        end 
      end
      
end
