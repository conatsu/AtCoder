# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)
cumulative_sum = Array.new(N + 1, 0)
(1..N).each do |i|
  cumulative_sum[i] = cumulative_sum[i - 1] + Alist[i - 1]
end

left = 0
right = 0
count = 0

while left < N
  right += 1 while right < N && cumulative_sum[right + 1] - cumulative_sum[left] <= K
  count += right - left
  left += 1
end

puts count
