# frozen_string_literal: true

N = gets.chomp.to_i
hlist = gets.chomp.split.map(&:to_i)

dp = Array.new(N)
dp[0] = 0

(1...N).each do |i|
  dp[i] = if i == 1
            (hlist[1] - hlist[0]).abs
          else
            [dp[i - 1] + (hlist[i] - hlist[i - 1]).abs,
             dp[i - 2] + (hlist[i] - hlist[i - 2]).abs].min
          end
end

puts dp[N - 1]
