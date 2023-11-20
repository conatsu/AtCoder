N = gets.chomp.to_i
Slist = []
N.times do
  Slist << gets.chomp
end

ansHash = {}
(0..N - 1).each do |i|
  next unless ansHash[Slist[i]].nil? && ansHash[Slist[i].reverse].nil?

  ansHash[Slist[i]] = 1
end

puts ansHash.length
