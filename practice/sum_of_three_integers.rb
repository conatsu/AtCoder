# link: https://atcoder.jp/contests/abc051/tasks/abc051_b
# frozen_string_literal: true

K, S = gets.chomp.split.map(&:to_i)

count_combination = 0

(0..K).each do |x|
  (0..K).each do |y|
    z = S - x - y
    count_combination += 1 if z >= 0 && z <= K
  end
end

puts count_combination
