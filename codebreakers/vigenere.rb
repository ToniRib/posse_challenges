require "pry"

class Vigenere
  attr_reader :key, :message

  def initialize(key, message)
    @key = key.chars.map { |l| letter_map[l.downcase] }
    @message = message
  end

  def encrypt_message
    i = -1

    message.chars.map do |l|
      if letter_is_part_of_alphabet(l)
        i = i + 1
        capital?(l) ? encrypt(l, i).upcase : encrypt(l, i)
      else
        l
      end
    end.join
  end

  private

  def letter_map
    [*"a".."z"].zip([*1..26]).to_h
  end

  def encrypt(letter, i)
    num = convert_letter_to_number(letter.downcase)

    new_index = (num + get_key_number(i)) % 26
    new_index = 26 if new_index == 0

    letter_map.key(new_index)
  end

  def convert_letter_to_number(letter)
    letter_map[letter]
  end

  def capital?(letter)
    letter == letter.upcase
  end

  def letter_is_part_of_alphabet(letter)
    letter_map.include?(letter.downcase)
  end

  def get_key_number(i)
    key[i % key.length]
  end
end

if __FILE__ == $0
  vigenere = Vigenere.new(ARGV[0], ARGV[1..-1].join(" "))
  puts vigenere.encrypt_message
end
