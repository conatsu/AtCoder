n, m = gets.chomp.split.map(&:to_i)
s = gets.chomp
c = gets.chomp.split.map(&:to_i)

p = Array.new(m + 1) { [] }
n.times { |i| p[c[i]].push(i) }

t = Array.new(n, '?')
(1..m).each do |i|
  k = p[i].size
  k.times do |j|
    t[p[i][(j + 1) % k]] = s[p[i][j]]
  end
end

puts t.join('')
