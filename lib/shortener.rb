module Shortener
  MAP = ('0'..'9').to_a + ('a'..'z').to_a + ('A'..'Z').to_a

  def encode(numeric)
    raise TypeError unless numeric.kind_of?(Numeric)
    return '0'  if numeric.zero?
    s = ''

    while numeric > 0
      s << Shortener::MAP[numeric % 62]
      numeric /= 62
    end
    s.reverse
  end

  def decode(base62)
    s = base62.to_s.reverse.split('')

    total = 0
    s.each_with_index do |char, index|
      if ord = MAP.index(char)
        total += ord * (62 ** index)
      else
        raise ArgumentError, "#{base62} has #{char} which is not valid"
      end
    end
    total.to_s
  end

  module_function :encode, :decode
end
