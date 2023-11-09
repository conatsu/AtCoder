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

answer_route = []
current = N - 1 # ゴールからスタートに向かって経路を辿る

while current.positive?
  answer_route.unshift(current + 1) # インデックスは0ベースなので、+1して調整
  current -= if current >= 2 && dp[current] == dp[current - 2] + Blist[current - 2]
               2 # Blistを使用した場合は2つ前に戻る
             else
               1 # Alistを使用した場合は1つ前に戻る
             end
end

answer_route.unshift(1) # スタート地点を追加

puts answer_route.length
puts answer_route.join(' ')
