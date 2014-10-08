require "minitest/autorun"

require_relative "../lib/toll_free/find_words"

describe TollFree::FindWords do
  it "can find subwords from the dictionary" do
    findwords = TollFree::FindWords.new( "23" )
    findwords.possibilities.must_equal( %w[ad ae be ce ] )
  end

  it "can turn list of words into strings" do
    findwords = TollFree::FindWords.new( "23" )
    findwords.possibilities
    findwords.to_s.must_equal( "ad\nae\nbe\nce" )
  end
end
