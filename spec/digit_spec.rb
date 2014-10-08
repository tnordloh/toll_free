require "minitest/autorun"

require_relative "../lib/toll_free/digit"

describe TollFree::Digit do
  it "converts a number to all possible letters" do
    lookup = TollFree::Digit.new( 2 )
    lookup.letters.must_equal( %w[a b c] )
  end
  it "catches invalid entries" do
    lookup = TollFree::Digit.new( 0 )
    -> do
        lookup.letters
    end.must_raise( RuntimeError )
  end
  it "knows if a number is valid" do
    lookup = TollFree::Digit.new( 0 )
    lookup.valid?.must_equal( false )
  end
end
