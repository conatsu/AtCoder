# frozen_string_literal: true

N = gets.chomp.to_i
heights = gets.chomp.split.map(&:to_i)

watering_count = 0
last_height = 0

heights.each do |height|
  watering_count += height - last_height if height > last_height
  last_height = height
end

puts watering_count
