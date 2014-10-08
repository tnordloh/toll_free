require_relative "digit"
require_relative "dictionary"
require_relative "words_from_letters"
module TollFree
  class FindWords
    def initialize phonenumber, 
                   dictionary = "/Users/tim/code/toll_free/conf/words"
      @digits = phonenumber.chars.map {|char|
        TollFree::Digit.new(char.to_i)
      }
      @dictionary = TollFree::Dictionary.new(dictionary)
    end
    def possibilities
      arrays =@digits.map {|digit| digit.letters }
      @wordlist = arrays[0].product(*arrays[1..-1]).map {|possibility| 
        possibility.join("")
      }.flat_map {|possibility| subwords(possibility) }
    end
    def to_s
      @wordlist.join("\n")
    end
    def subwords this_word 
      startlist=TollFree::WordsFromLetters.new(@dictionary, this_word).find
      finallist = []
      while startlist.size > 0 
        list = startlist.shift
        if list.fully_matched?
          finallist << list
        else
          list.find.each {|item| startlist << item}
        end
      end
      finallist.flat_map {|item| item.to_s }
    end
  end
end
