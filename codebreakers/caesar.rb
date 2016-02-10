require 'pry'

class Caesar
  attr_reader :offset,
              :message

  def initialize(offset, message)
    @message = message
    @offset = offset.to_i
  end

  def lowercase
    lowers= [*"a".."z"]
    lowers.zip(lowers.rotate(offset)).to_h
  end

  def uppercase
    uppers = [*"A".."Z"]
    uppers.zip(uppers.rotate(offset)).to_h
  end

  def punctuation
    extra = [" ", ".", ",", "!", "?"]
    extra.zip(extra).to_h
  end

  def cypher
    alphabet = lowercase.merge(uppercase)
    alphabet.merge(punctuation)
  end

    def encrypt_message
      message.chars.flatten.map {|mssg| cypher[mssg]}
    end
  end

if __FILE__ == $0
c = Caesar.new(ARGV[0], ARGV[1..-1])
c.encrypt_message
end
