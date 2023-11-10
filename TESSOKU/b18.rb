# frozen_string_literal: true

N, S = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

dp = Array.new(N + 1) { Array.new(S + 1, false) }
dp[0][0] = true
(1..N).each do |i|
  (0..S).each do |j|
    dp[i][j] = dp[i - 1][j]
    dp[i][j] ||= dp[i - 1][j - Alist[i - 1]] if j >= Alist[i - 1]
  end
end

if dp[N][S]
  answer = []
  current = S
  while current.positive?
    if current >= Alist[N - 1] && dp[N - 1][current - Alist[N - 1]]
      answer.unshift(N)
      current -= Alist[N - 1]
    end
    N -= 1
  end
  puts answer.length
  puts answer.join(' ')
else
  puts(-1)
end
