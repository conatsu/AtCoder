# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

max_time = Alist.max * K
min_time = 0
while max_time - min_time > 1
  mid_time = (max_time + min_time) / 2
  sum = 0
  Alist.each do |a|
    sum += mid_time / a
  end
  if sum >= K # 十分な数を印刷していれば、時間を短くできるかもしれない
    max_time = mid_time
  else # まだ \( K \) 枚に達していない場合
    min_time = mid_time
  end
end

# 最後に max_time を出力します。max_time は最小の可能性のある時間で、
# K 枚目のチラシが印刷されるのに十分な時間です。
puts max_time
