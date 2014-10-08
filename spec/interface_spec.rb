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
    tollfree.must_equal("AD\nA-D\nAE\nA-E\nA-F\nB-D\nBE\n"+
                             "B-E\nB-F\nC-D\n"+
                             "CE\nC-E\nC-F")
  end
end
