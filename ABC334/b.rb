# frozen_string_literal: true

A, M, L, R = gets.chomp.split.map(&:to_i)

# L から R の間の A + kM の地点の数を数える
# L と R の間で最初の A + kM の地点を見つける
start_k = (L - A + M - 1) / M
end_k = (R - A) / M

# 条件を満たす地点の数を計算
count = [end_k - start_k + 1, 0].max

puts count
