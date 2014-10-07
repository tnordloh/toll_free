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
    tollfree.must_equal("A-D\nAD\nA-E\nAE\nA-F\nB-D\nB-E\n"+
                             "BE\nB-F\nC-D\nC-E\n"+
                             "CE\nC-F")
  end
end
