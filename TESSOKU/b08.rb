# frozen_string_literal: true

N = gets.chomp.to_i
dots = Array.new(N) { gets.chomp.split.map(&:to_i) }
max_x = dots.map { |x, _| x }.max
dots.map { |x, _| x }.min
max_y = dots.map { |_, y| y }.max
dots.map { |_, y| y }.min

Q = gets.chomp.to_i
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }
table = Array.new(max_x + 1) { Array.new(max_y + 1, 0) }
dots.each do |dot|
  table[dot[0]][dot[1]] += 1
end

# X軸方向の累積和
(1..max_x).each do |i|
  (1..max_y).each do |j|
    table[i][j] += table[i][j - 1]
  end
end

# Y軸方向の累積和
(1..max_y).each do |j|
  (1..max_x).each do |i|
    table[i][j] += table[i - 1][j]
  end
end

queries.each do |x1, y1, x2, y2|
  puts table[x2][y2] - table[x1 - 1][y2] - table[x2][y1 - 1] + table[x1 - 1][y1 - 1]
end
