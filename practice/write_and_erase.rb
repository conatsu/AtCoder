# frozen_string_literal: true

N = gets.chomp.to_i
frequency_map = Hash.new(0)

N.times do
  num = gets.chomp.to_i
  if frequency_map[num].positive?
    frequency_map[num] -= 1
  else
    frequency_map[num] += 1
  end
end

puts frequency_map.values.sum
