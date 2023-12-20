# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)

ans = 0
m0 = 0
(1..N).each do |i|
  m0 += 1 if (i % K).zero?
end

ans += m0 * m0 * m0

if K.even?
  c = 0
  (1..N).each do |i|
    c += 1 if i % K == K / 2
  end
  ans += c * c * c
end

puts ans
