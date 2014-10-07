require_relative "digit"
require_relative "dictionary"
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
      arrays =@digits.map {|digit|
        digit.letters
      }
      possibilities = arrays[0].product(*arrays[1..-1]).map {|possibility| 
        possibility.join("")
      }
      @wordlist=possibilities.flat_map {|possibility| 
        subwords(possibility)
      }
    end
    def to_s
      @wordlist.join("\n")
    end
    def subwords this_word 
      chararray = this_word.split(//)
      words = []
      words << chararray 
      words.each {|word|
        (1..word.size-1).each {|joinhere|
          temp = word.dup
          placeholder= temp.delete_at(joinhere)
          temp[joinhere-1]=temp[joinhere-1]+ placeholder
          words << temp unless words.include?(temp)
        }
      }
      words.select! {|word| all_subwords_valid?(word) }
      words.map {|word| word.join("-")}
    end
    private
    def all_subwords_valid? list
      value=list.all? {|testword|
        @dictionary.include?(testword)
      }
      value
    end
  end
end
