require "minitest/autorun"

require_relative "../lib/toll_free"

describe TollFree do
  it "catches invalid dictionary files" do
    -> do
      tollfree = TollFree.find_numbers("NOT A file","123")
    end.must_raise(RuntimeError)
  end
  it "catches invalid numbers " do
    -> do
      tollfree = TollFree.find_numbers("/usr/share/dict/words","1")
    end.must_raise(RuntimeError)
  end
  it "catches invalid letters " do
    -> do
      tollfree = TollFree.find_numbers("/usr/share/dict/words","hello")
    end.must_raise(RuntimeError)
  end
  it "returns a valid word list" do
    tollfree = TollFree.find_numbers("/usr/share/dict/words","23")
    tollfree.must_equal("a-d\nad\na-e\nae\na-f\nb-d\nb-e\n"+
                             "be\nb-f\nc-d\nc-e\n"+
                             "ce\nc-f")
  end
end
