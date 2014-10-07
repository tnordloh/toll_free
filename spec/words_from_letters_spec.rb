require "minitest/autorun"

require_relative "../lib/toll_free/dictionary"

describe TollFree::WordsFromLetters do
  it "gets a list of words" do
    wfl=TollFree::WordsFromLetters.new("dogcat")
    wfl.find.must_equal(TollFree::WordsFromLetters.new("cat",[dog])
  end
end
