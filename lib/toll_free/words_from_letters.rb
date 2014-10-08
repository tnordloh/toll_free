
module TollFree
  class WordsFromLetters
    def initialize dictionary,unmatched_string,*matches 
      @dictionary,@unmatched_string,@matches=
          dictionary,unmatched_string,matches
    end

    attr_accessor :unmatched_string

    def find
      ( 0...@unmatched_string.length ).map {|letter|
        if @dictionary.include?( @unmatched_string[0..letter] )
          self.class.new( @dictionary,
                          @unmatched_string[letter+1..-1],
                          *@matches, 
                          @unmatched_string[0..letter]
                        ) 
        end
      }.compact
    end

    def matches
      @matches.select { |match| match != [] }
    end

    def to_s
      matches.join( "-" )
    end

    def fully_matched?
      return true if @unmatched_string == ""
      return false
    end
  end
end

