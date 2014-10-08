module TollFree
  class Dictionary

    def initialize myvariable
      puts "initializing dictionary"
      @dictionary = (File.open(myvariable).readlines).select {
        |word| word !~ /.*[A-Z].*/ }
      .map {|word| word.chomp}
      puts "done initializing dictionary"
    end

    def include? word
      !!bsearch(word)
    end

    def bsearch(e, l = 0, u = @dictionary.length - 1)
      return if l>u;m=(l+u)/2;e<@dictionary[m]?u=m-1:l=m+1;e==@dictionary[m]?m:bsearch(e,l,u)
    end
  end
end
