N = gets.chomp.to_i
plist = gets.chomp.split.map(&:to_i)

qlist = Array.new(N, 0)
plist.each_with_index do |p, i|
  qlist[p - 1] = i + 1
end

puts qlist.join(' ')