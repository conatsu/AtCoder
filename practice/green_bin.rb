# frozen_string_literal: true

N = gets.chomp.to_i
frequency_map = Hash.new(0)

N.times do
  sorted_str = gets.chomp.chars.sort.join
  frequency_map[sorted_str] += 1
end

anagrams = frequency_map.values.sum { |count| count * (count - 1) / 2 }

puts anagrams
