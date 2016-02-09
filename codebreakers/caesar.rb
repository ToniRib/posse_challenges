letters = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
upper = letters.map(&:capitalize)

def uppercase?(letter)
  letter.upcase == letter
end

def punctuation?(letter)
  /[?!.]/ =~ letter
end

key = ARGF.argv.shift.to_i

sentence = ARGF.argv.map do |word|
  word.chars.map do |letter|
    if uppercase?(letter)
      new_index = (upper.index(letter) + key) % 26
      upper[new_index]
    elsif punctuation?(letter)
      letter
    else
      new_index = (letters.index(letter) + key) % 26
      letters[new_index]
    end
  end.join
end.join(" ")

puts sentence
