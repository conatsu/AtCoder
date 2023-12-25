# frozen_string_literal: true

N, Q = gets.chomp.split.map(&:to_i)
R = gets.chomp.split.map(&:to_i).sort

# 累積和を計算
cumulative_sum = R.reduce([]) { |sums, r| sums << (sums.last || 0) + r }

Q.times do
  x = gets.chomp.to_i
  ans = 0
  left = 0
  right = N - 1

  # 二分探索で x を超えるまでの要素数を高速に見つける
  while left <= right
    mid = (left + right) / 2
    if cumulative_sum[mid] <= x
      ans = mid + 1
      left = mid + 1
    else
      right = mid - 1
    end
  end

  puts ans
end
