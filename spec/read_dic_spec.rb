require "minitest/autorun"

require_relative "../lib/toll_free/lookup"

describe TollFree::Lookup do
  it "converts a number to all possible letters" do
    lookup = TollFree::Lookup.new(2)
    lookup.letters.must_equal(%w[a b c])
  end
  it "rejects invalid entries" do
    lookup = TollFree::Lookup.new(0)
    lookup.letters.must_be_nil()
  end
end
