require_relative "toll_free/find_words"
require_relative "toll_free/dictionary"

module TollFree

  def self.find_numbers(dictionary,phone_number)

    fail "Dictionary file doesn't exist" unless File.exist?(dictionary)

    tollfree = TollFree::FindWords.new(phone_number,dictionary)
    tollfree.possibilities
    tollfree.to_s.upcase!

  end

end

