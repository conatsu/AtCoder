# frozen_string_literal: true

N, W = gets.chomp.split.map(&:to_i)
wvlist = Array.new(N) { gets.chomp.split.map(&:to_i) } # 重さと価値のリスト
dp = Array.new(N + 1) { Array.new(W + 1, 0) } # DPテーブル

(1..N).each do |i|
  (0..W).each do |j|
    dp[i][j] = if j < wvlist[i - 1][0]
                 dp[i - 1][j]
               else
                 [dp[i - 1][j], dp[i - 1][j - wvlist[i - 1][0]] + wvlist[i - 1][1]].max
               end
  end
end

ans = 0
dp.each do |row|
  ans = row.max if ans < row.max
end

puts ans
