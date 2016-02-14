require "pry"

class Vigenere
  attr_reader :key, :message

  def initialize(key, message)
    @key = key.chars.map { |l| letter_map[l.downcase] }
    @message = message
  end

  def letter_map
    [*"a".."z"].zip([*1..26]).to_h
  end

  def encrypt_message
    encrypted = ""
    i = -1

    message.chars.each do |l|
      if letter_map.include?(l)
        i = i + 1
        num = convert_letter_to_number(l.downcase)
        this_key = get_key_number(i)
        new_index = (num + this_key) % 26
        new_index = 26 if new_index == 0
        encrypted << letter_map.key(new_index)
      elsif letter_map.include?(l.downcase)
        i = i + 1
        num = convert_letter_to_number(l.downcase)
        this_key = get_key_number(i)
        new_index = (num + this_key) % 26
        new_index = 26 if new_index == 0
        encrypted << letter_map.key(new_index).upcase
      else
        encrypted << l
      end
    end

    encrypted
  end

  def convert_letter_to_number(letter)
    letter_map[letter]
  end

  def get_key_number(i)
    key[i % key.length]
  end
end

if __FILE__ == $0
  vigenere = Vigenere.new(ARGV[0], ARGV[1..-1].join(" "))
  puts vigenere.encrypt_message
end
