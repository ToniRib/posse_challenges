class Initials
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def get_initials
    

  end
end

if __FILE__ == $0
i = Initials.new(ARGV[0..-1])

end







#
# array = ["Taylor Swift"]
# puts array.map {|x| x[0]}.inject(:+)
#
#
#
#
#
#
#
#
#
# # Problem 2
# array1 = [*"a".."m"]
# # puts array1
# array2 = [*"n".."z"]
# puts array2
# array1.zip(array2)
# array1
# # chars - splits it so each letter is it's own string
# string = "emily"
# # string.chars.map {|x| x.downcase == complete.fetch(x)}
# sentence = "trivial"
# sentence.map {|x| x.chars}.map {|y| complete.fetch(y)}
# spaced.flatten.map {|x| complete[x]}
