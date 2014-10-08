require "minitest/autorun"

require_relative "../lib/toll_free/find_words"
require_relative "../lib/toll_free/dictionary"

describe TollFree::FindWords do
  it "gets a list of words" do
    findwords = TollFree::FindWords.new( "323" )
    dictionary = TollFree::Dictionary.new( "/usr/share/dict/words" )
    findwords.possibilities.must_equal( %w[dad fad dae fae].sort )
  end
end
