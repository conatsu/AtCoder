# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i).sort

half = N / 2
left = Alist[0..half - 1]
right = Alist[half..]

left_sum = Array.new(1 << half, 0)
(1 << half).times do |i|
  half.times do |j|
    left_sum[i] += left[j] if i[j] == 1
  end
end

right_sum = Array.new(1 << (N - half), 0)
(1 << (N - half)).times do |i|
  (N - half).times do |j|
    right_sum[i] += right[j] if i[j] == 1
  end
end

right_sum.sort!
left_sum.sort!
found = left_sum.any? do |l|
  right_sum.bsearch { |r| K - l <=> r }
end

puts found ? 'Yes' : 'No'
