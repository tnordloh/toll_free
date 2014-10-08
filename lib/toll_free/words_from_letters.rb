
module TollFree
  class WordsFromLetters
    def initialize(dictionary,unmatched_string,*matches)
      @dictionary,@unmatched_string,@matches=
                   dictionary,unmatched_string,matches
    end

    attr_accessor :unmatched_string

    def find
      (0...@unmatched_string.length).map {|letter|
        potential_match = @unmatched_string[0..letter]
        if @dictionary.include?(potential_match)
          self.class.new( @dictionary,
                          @unmatched_string[letter+1..-1],
                          *@matches,
                          potential_match
                        )
        end
      }.compact
    end

    def matches
      @matches.select { |match| match != [] }
    end

    def to_s
      matches.join("-")
    end

    def fully_matched?
      @unmatched_string == ""
    end

  end

end

