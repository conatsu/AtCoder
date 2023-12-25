# frozen_string_literal: true

_, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

pre = Array.new(k + 1, 0)
suf = Array.new(k + 1, 0)

(1..k).each do |i|
  pre[i] = pre[i - 1]
  pre[i] += a[i - 1] - a[i - 2] if (i % 2).zero?
end

(k - 1).downto(0).each do |i|
  suf[i] = suf[i + 1]
  suf[i] += a[i + 1] - a[i] if ((k - i) % 2).zero?
end

ans = 1e9
(0..k).step(2).each do |i|
  ans = [ans, pre[i] + suf[i]].min
end

puts ans
