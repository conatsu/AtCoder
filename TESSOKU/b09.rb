# frozen_string_literal: true

N = gets.chomp.to_i
squarelist = []
N.times do
  squarelist << gets.chomp.split.map(&:to_i)
end

paper = Array.new(1502) { Array.new(1502, 0) }
table = Array.new(1502) { Array.new(1502, 0) }

squarelist.each do |square|
  a, b, c, d = square
  paper[a][b] += 1
  paper[c][b] -= 1
  paper[a][d] -= 1
  paper[c][d] += 1
end

1502.times do |i|
  1502.times do |j|
    table[i][j] = paper[i][j] + table[i - 1][j] + table[i][j - 1] - table[i - 1][j - 1]
  end
end

count = table.flatten.count { |num| num >= 1 }
puts count
