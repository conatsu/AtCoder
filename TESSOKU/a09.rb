# frozen_string_literal: true

H, W, N = gets.chomp.split.map(&:to_i)
queries = Array.new(N) { gets.chomp.split.map(&:to_i) }

diff = Array.new(H + 1) { Array.new(W + 1, 0) }
queries.each do |h1, w1, h2, w2|
  diff[h1 - 1][w1 - 1] += 1
  diff[h2][w1 - 1] -= 1
  diff[h1 - 1][w2] -= 1
  diff[h2][w2] += 1
end

field = Array.new(H) { Array.new(W, 0) }
(0...H).each do |i|
  (0...W).each do |j|
    diff[i][j] += diff[i - 1][j] if i.positive?
    diff[i][j] += diff[i][j - 1] if j.positive?
    diff[i][j] -= diff[i - 1][j - 1] if i.positive? && j.positive?
    field[i][j] = diff[i][j]
  end
end

field.each do |row|
  puts row.join(' ')
end
