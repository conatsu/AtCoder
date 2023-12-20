# # https://atcoder.jp/contests/abc195/tasks/abc195_b
# # frozen_string_literal: true

# A, B, W = gets.chomp.split.map(&:to_i)

# min_count = W * 1000 / B
# max_count = W * 1000 / A
# anses = []
# min_count.upto(max_count) do |count|
#   anses << count if W * 1000 >= A * count && W * 1000 <= B * count
# end

# anses = anses.uniq

# if anses.empty?
#   puts 'UNSATISFIABLE'
# else
#   puts "#{anses.min} #{anses.max}"
# end

# 下記の通りO(1)で解ける
# frozen_string_literal: true

A, B, W = gets.chomp.split.map(&:to_i)
upper = (1000.0 * W / A).floor
lower = (1000.0 * W / B).ceil

if lower > upper
  puts 'UNSATISFIABLE'
else
  puts "#{lower} #{upper}"
end
