# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
balls = gets.chomp.split.map(&:to_i)
balls_hash = Hash.new(0)
balls.each do |ball|
  balls_hash[ball] += 1
end

if balls_hash.size <= K
  puts 0
else
  puts balls_hash.values.sort[0..(balls_hash.size - K - 1)].sum
end

# use バケット
# N, K = gets.chomp.split.map(&:to_i)
# balls = gets.chomp.split.map(&:to_i)
# balls_frequency = Array.new(N + 1, 0)
# balls.each do |ball|
#  balls_frequency[ball] += 1
# end
#
# if balls_frequency.count { |frequency| frequency > 0 } <= K
#  puts 0
# else
#  puts balls_frequency.sort[0..(balls_frequency.size - K - 1)].sum
# end
