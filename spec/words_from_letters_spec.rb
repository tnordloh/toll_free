require "minitest/autorun"

require_relative "../lib/toll_free/dictionary"
require_relative "../lib/toll_free/words_from_letters"

describe TollFree::WordsFromLetters do
  it "returns a wordsfromletters object with the first word found" do
    dictionary=TollFree::Dictionary.new( "/usr/share/dict/words" )
    wfl=TollFree::WordsFromLetters.new( dictionary,"dogcat" )
    testlist =wfl.find
    testlist.flat_map {|list| 
      list.matches
    }.must_equal( %w[d do dog] )
    testlist.map {|list| 
      list.unmatched_string
    }.must_equal( %w[ogcat gcat cat] )
  end
  it "finds whole words in a list" do
    dictionary=TollFree::Dictionary.new( "/usr/share/dict/words" )
    wfl=TollFree::WordsFromLetters.new( dictionary,"dog" )
    testlist =wfl.find
    finallist = []
    while testlist.size > 0 
      list = testlist.shift
      if list.unmatched_string == ""
        finallist << list
      else
        list.find.each {|item| testlist << item}
      end
    end
    equalizer = [ %w[dog],%w[do g],%w[d o g] ]
    finallist.map {|item| item.matches }.must_equal( equalizer )
  end
end
