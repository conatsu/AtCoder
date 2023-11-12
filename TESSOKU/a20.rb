# frozen_string_literal: true

S = gets.chomp
T = gets.chomp

dp = Array.new(S.length + 1) { Array.new(T.length + 1, 0) }
dp[0][0] = 0

(0..S.length).each do |i|
  (0..T.length).each do |j|
    if i >= 1 && j >= 1
      dp[i][j] = if S[i - 1] == T[j - 1]
                   [dp[i - 1][j - 1] + 1, dp[i - 1][j], dp[i][j - 1]].max
                 else
                   [dp[i - 1][j], dp[i][j - 1]].max
                 end
    elsif i >= 1
      dp[i][j] = dp[i - 1][j]
    elsif j >= 1
      dp[i][j] = dp[i][j - 1]
    end
  end
end

puts dp[S.length][T.length]
