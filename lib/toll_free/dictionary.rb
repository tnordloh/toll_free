module TollFree
  class Dictionary

    def initialize path
      @words = {}
      File.foreach(path) do |word|
        next if word =~ /[A-Z]/
        @words[word.strip] = true
      end
    end

    def include? word
      @words.include? word
    end

  end
end
