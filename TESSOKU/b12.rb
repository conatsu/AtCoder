# frozen_string_literal: true

N = gets.chomp.to_i

min = 0.0
max = 47.0

while max - min > 0.001 # 範囲が0.001より大きい間はループを続ける
  mid = (max + min) / 2.0
  tmp = mid**3 + mid
  if (tmp - N).abs <= 0.001 || (tmp - N).abs / N <= 0.001
    puts mid
    break # 正しい値を見つけたらループを抜ける
  elsif tmp > N
    max = mid  # maxの更新
  else
    min = mid  # minの更新
  end
end
