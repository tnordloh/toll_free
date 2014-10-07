module TollFree
  class Dictionary

    def initialize myvariable
      @dictionary = File.new(myvariable).readlines
      @dictionary.select! {|word| word !~ /.*[A-Z].*/ }
      @dictionary.map! {|word| word.chomp}
    end

    def include? word
      @dictionary.include?(word)
    end

  end
end
