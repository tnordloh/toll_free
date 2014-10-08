module TollFree
  class Digit
    def initialize number
      @number=number
      @LOOKUPHASH = { 
        2 => %w[a b c],
        3 => %w[d e f],
        4 => %w[g h i],
        5 => %w[j k l],
        6 => %w[m n o],
        7 => %w[p q r s],
        8 => %w[t u v],
        9 => %w[w x y z]
      }
    end
    def valid?
      !!@LOOKUPHASH[ @number ]
    end
    def letters
      fail "invalid number" unless valid?
      @LOOKUPHASH.fetch( @number, "" )
    end
  end
end
