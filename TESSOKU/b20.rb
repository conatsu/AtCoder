# frozen_string_literal: true

S = gets.chomp
T = gets.chomp
n = S.length
m = T.length

dp = Array.new(n + 1) { Array.new(m + 1, 0) }
dp[0][0] = 0

(0..n).each do |i|
  (0..m).each do |j|
    dp[i][j] = if i.zero?
                 j
               elsif j.zero?
                 i
               elsif S[i - 1] == T[j - 1]
                 dp[i - 1][j - 1]
               else
                 [dp[i - 1][j - 1] + 1, dp[i - 1][j] + 1, dp[i][j - 1] + 1].min
               end
  end
end

puts dp[n][m]
