# frozen_string_literal: true

T = gets.chomp.to_i
N = gets.chomp.to_i
lr = Array.new(N) { gets.chomp.split.map(&:to_i) }
diff = Array.new(T + 1, 0)

0..N.times do |i|
  diff[lr[i][0]] += 1
  diff[lr[i][1]] -= 1
end

ans = Array.new(T, 0)
ans[0] = diff[0]
(0..T - 2).each do |i|
  ans[i + 1] = ans[i] + diff[i + 1]
end

ans.each do |a|
  puts a
end
