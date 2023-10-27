# frozen_string_literal: true

N, K = gets.chomp.split(' ').map(&:to_i)

ans = 0
(1..N).each do |i|
  (1..N).each do |j|
    k = K - i - j
    ans += 1 if k >= 1 && k <= N
  end
end

puts ans
