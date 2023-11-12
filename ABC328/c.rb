# frozen_string_literal: true

N, Q = gets.chomp.split.map(&:to_i)
S = gets.chomp
lrlist = []
Q.times do
  lrlist << gets.chomp.split.map(&:to_i)
end

# 隣接する同じ文字のペアの累積カウントを求める
acc = [0]
(1...N).each do |i|
  acc[i] = acc[i - 1]
  acc[i] += 1 if S[i] == S[i - 1]
end
acc << acc[-1] # 最後の要素を追加

# 各質問に対する答えを求める
lrlist.each do |l, r|
  puts acc[r - 1] - acc[l - 1]
end
