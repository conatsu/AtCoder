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

answer_route = []
current = N - 1

while current.positive?
  answer_route.unshift(current + 1)
  current -= if current >= 2 && dp[current] == dp[current - 2] + (hlist[current] - hlist[current - 2]).abs
               2
             else
               1
             end
end

answer_route.unshift(1)
puts answer_route.length
puts answer_route.join(' ')
