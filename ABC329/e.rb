# frozen_string_literal: true

n, m = gets.split.map(&:to_i)
s = gets.chomp
t = gets.chomp
used = Array.new(n - m + 1, false)
q = []
check = lambda do |i|
  return if used[i]

  ok = true
  (0...m).each do |j|
    ok &&= (s[i + j] == '#' || s[i + j] == t[j])
  end
  if ok
    used[i] = true
    q.push(i)
  end
end

(0...(n - m + 1)).each { |i| check.call(i) }

until q.empty?
  i = q.shift
  (0...m).each { |j| s[i + j] = '#' }
  ([(i - m + 1), 0].max..[i + m - 1, n - m].min).each { |j| check.call(j) }
end

puts s == '#' * n ? 'Yes' : 'No'
