class Initials
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def get_initials
    message.map { |w| w.chars.first }.join
  end
end

if __FILE__ == $0
  i = Initials.new(ARGV[0..-1])
  puts i.get_initials
end
