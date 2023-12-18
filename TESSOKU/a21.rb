# frozen_string_literal: true

N = gets.to_i
P = Array.new(N + 1)
A = Array.new(N + 1)
(1..N).each do |i|
  P[i], A[i] = gets.split.map(&:to_i)
end

dp = Array.new(N + 1) { Array.new(N + 2, 0) }

(N - 1).downto(0) do |len|
  (1..(N - len)).each do |l|
    r = l + len

    score1 = l >= 2 && l <= P[l - 1] && P[l - 1] <= r ? A[l - 1] : 0
    score2 = r <= N - 1 && l <= P[r + 1] && P[r + 1] <= r ? A[r + 1] : 0

    dp[l][r] = if l == 1
                 dp[l][r + 1] + score2
               elsif r == N
                 dp[l - 1][r] + score1
               else
                 [dp[l - 1][r] + score1, dp[l][r + 1] + score2].max
               end
  end
end

answer = 0
(1..N).each do |i|
  answer = [answer, dp[i][i]].max
end
puts answer
