# frozen_string_literal: true

H, W = gets.chomp.split.map(&:to_i)
Xtable = Array.new(H) { gets.chomp.split.map(&:to_i) }
Q = gets.chomp.to_i
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }

# 各行の累積和を計算
sums_row = Array.new(H) { Array.new(W, 0) }
H.times do |i|
  W.times do |j|
    sums_row[i][j] = if j.zero?
                       Xtable[i][j]
                     else
                       sums_row[i][j - 1] + Xtable[i][j]
                     end
  end
end

# クエリの答えを計算
queries.each do |query|
  h1, w1, h2, w2 = query
  sum = 0
  (h1 - 1).upto(h2 - 1) do |i|
    sum += if w1 == 1
             sums_row[i][w2 - 1]
           else
             sums_row[i][w2 - 1] - sums_row[i][w1 - 2]
           end
  end
  puts sum
end
