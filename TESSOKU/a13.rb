# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

left = 0
right = 0
count = 0

while left < N
  right += 1 while right < N && Alist[right] - Alist[left] <= K
  count += right - left - 1
  left += 1
end

puts count
