require "minitest/autorun"

require_relative "../lib/toll_free/find_words"

describe TollFree::FindWords do
  it "can make a list of digits" do
    word = TollFree::FindWords.new("23")
    word.possibilities.must_equal(%w[ad ae af bd be bf cd ce cf])
  end
end
