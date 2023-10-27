# frozen_string_literal: true

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)
D = gets.chomp.to_i
queries = Array.new(D) { gets.chomp.split.map(&:to_i) }

max_from_start = Array.new(N)
max_from_end = Array.new(N)

max_from_start[0] = Alist[0]
(1...N).each do |i|
  max_from_start[i] = [max_from_start[i - 1], Alist[i]].max
end

max_from_end[N - 1] = Alist[N - 1]
(N - 2).downto(0) do |i|
  max_from_end[i] = [max_from_end[i + 1], Alist[i]].max
end

queries.each do |l, r|
  left_max = l > 1 ? max_from_start[l - 2] : -Float::INFINITY
  right_max = r < N ? max_from_end[r] : -Float::INFINITY

  puts [left_max, right_max].max
end
