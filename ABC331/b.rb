# frozen_string_literal: true

def min_cost_to_buy_eggs(n, s, m, l)
  pack_sizes = [6, 8, 12]
  pack_prices = [s, m, l]

  # 十分に大きな数値で配列を初期化
  max_n = n + 12 # 12個入りのパックサイズを加味
  dp = Array.new(max_n + 1, Float::INFINITY)
  dp[0] = 0

  (1..max_n).each do |i|
    pack_sizes.zip(pack_prices).each do |size, price|
      dp[i] = [dp[i], dp[i - size] + price].min if i - size >= 0
    end
  end

  # N個以上の卵を買うための最小コストを見つける
  min_cost = dp[n..max_n].min
  min_cost.infinite? ? -1 : min_cost
end

# 標準入力からデータを読み込む
input = gets.chomp.split.map(&:to_i)
n, s, m, l = input

# 最小コストを計算して出力
puts min_cost_to_buy_eggs(n, s, m, l)
