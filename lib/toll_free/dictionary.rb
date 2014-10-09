module TollFree
  class Dictionary

    def initialize path, maxsize=7
      @words = {}
      @nonexistent = {}
      @last_word_read= ""
      @reader = Fiber.new do
        File.foreach(path) do |word|
          next if word =~ /[A-Z]/
          next if word.length > maxsize
          Fiber.yield word.strip
        end
      end
    end

    def include?(word)
      return false if @nonexistent.include? word
      return true if @words.include? word
      read_up_to(word) unless @last_word_read==nil
      return true if @words.include? word
      @nonexistent[word]=false
      false
    end

    private
    
    def initialize_dictionary_reader
    end

    def read_up_to(word)
      while word > @last_word_read
        1000.times do #check next 1000 words.
                      #this to preveng the while comparison
          #from runnig as frequently, which was showing up in 
          #the profiler as a reason that the include? function
          #was slow.
          @last_word_read = @reader.resume
          return if @last_word_read == nil
          @words[@last_word_read] = true
        end
      end
    end

  end

end

