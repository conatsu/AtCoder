# frozen_string_literal: true

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)
Blist = gets.chomp.split.map(&:to_i)

dp = Array.new(N)
dp[0] = 0
dp[1] = Alist[0]
(2...N).each do |i|
  dp[i] = [dp[i - 1] + Alist[i - 1], dp[i - 2] + Blist[i - 2]].min
end

puts dp[N - 1]
