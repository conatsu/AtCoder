# frozen_string_literal: true

SIGN = ['<', '>'].freeze

S = gets.chomp.chars
N = S.size + 1

left_counts = Array.new(N, 0)
right_counts = Array.new(N, 0)

# 左側の '<' の連続数を計算
(1...N).each do |i|
  left_counts[i] = S[i - 1] == SIGN[0] ? left_counts[i - 1] + 1 : 0
end

# 右側の '>' の連続数を計算
(N - 2).downto(0) do |i|
  right_counts[i] = S[i] == SIGN[1] ? right_counts[i + 1] + 1 : 0
end

# 各位置の答えを計算
ans = left_counts.zip(right_counts).map { |left, right| [left, right].max }

puts ans.sum
