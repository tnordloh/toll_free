require "minitest/autorun"

require_relative "../lib/toll_free/dictionary"

describe TollFree::Dictionary do
  it "can lookup a word" do
    dictionary = TollFree::Dictionary.new("/usr/share/dict/words")
    dictionary.include?("ada").must_equal(true)#
  end
  it "can reject a nonexistent word" do
    dictionary = TollFree::Dictionary.new("/usr/share/dict/words")
    dictionary.include?("fabe").must_equal(false)#
  end
  it "can reject a nonexistent word from my custom dictionary" do
    dictionary = TollFree::Dictionary.new("/Users/tim/code/toll_free/conf/words")
    dictionary.include?("fabe").must_equal(false)#
    dictionary.include?("f").must_equal(false)#
  end
end
