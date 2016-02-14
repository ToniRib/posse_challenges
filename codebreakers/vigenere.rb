require "pry"

class Vigenere
  attr_reader :key, :message

  def initialize(key, message)
    @key = key.chars.map { |l| letter_map[l] }
    @message = message
  end

  def letter_map
    {
      "a" => 1,  "b" => 2,  "c" => 3,  "d" => 4,  "e" => 5,  "f" => 6,
      "g" => 7,  "h" => 8,  "i" => 9,  "j" => 10, "k" => 11, "l" => 12,
      "m" => 13, "n" => 14, "o" => 15, "p" => 16, "q" => 17, "r" => 18,
      "s" => 19, "t" => 20, "u" => 21, "v" => 22, "w" => 23, "x" => 24,
      "y" => 25, "z" => 26
    }
  end

  def encrypt_message
    encrypted = message.chars.map.with_index do |l, idx|
      if letter_map.include?(l)
        binding.pry
        letter_map.key((letter_map[l] + key[idx % key.length]) % 27)
      elsif letter_map.include?(l.downcase)
        letter_map.key((letter_map[l.downcase] + key[idx % key.length]) % 27).upcase
      else
        l
      end
    end

    encrypted.join
  end
end

if __FILE__ == $0
  vigenere = Vigenere.new(ARGV[0], ARGV[1..-1].join(" "))
  puts vigenere.encrypt_message
end
