# frozen_string_literal: true

N, W = gets.chomp.split.map(&:to_i)
wvlist = Array.new(N) { gets.chomp.split.map(&:to_i) } # 重さと価値のリスト
sum = wvlist.map { |wv| wv[1] }.sum
dp = Array.new(N + 1) { Array.new(sum + 1, Float::INFINITY) } # DPテーブル
dp[0][0] = 0 # 0個の品物で価値0を達成する重さは0

(1..N).each do |i|
  (0..sum).each do |j|
    dp[i][j] = if j < wvlist[i - 1][1]
                 dp[i - 1][j]
               else
                 [dp[i - 1][j], dp[i - 1][j - wvlist[i - 1][1]] + wvlist[i - 1][0]].min
               end
  end
end

ans = 0
(0..sum).each do |j|
  ans = j if dp[N][j] <= W
end

puts ans
