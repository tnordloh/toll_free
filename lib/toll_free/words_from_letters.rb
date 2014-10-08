
module TollFree
  class WordsFromLetters
    def initialize dictionary,unmatched_string,*matches 
      @dictionary,@unmatched_string,@matches=
          dictionary,unmatched_string,matches
    end

    def find
      (0...@unmatched_string.length).map {|letter|
        if @dictionary.include?(@unmatched_string[0..letter])
          next if @unmatched_string[letter+1..-1] == nil
          self.class.new(@dictionary,@unmatched_string[letter+1..-1],*@matches,
                        @unmatched_string[0..letter]) or raise "bad class creation"
        end
      }.select {|list| list != nil}
    end
    def unmatched_string
      if @unmatched_string == nil
        return ""
      end
      return @unmatched_string
    end
    def matches
      @matches.select {|match| match != []}
    end
    def to_s
      matches.join("-")
    end

  end
end

