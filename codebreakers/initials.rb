initials = ARGF.argv.map do |name|
  name[0].capitalize
end.join

puts initials
