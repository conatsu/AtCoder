# frozen_string_literal: true

N = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

frequency_map = Hash.new(0)
deleted = 0
a.each do |num|
  frequency_map[num] += 1
end

frequency_map.each do |key, frequency|
  if key > frequency
    deleted += frequency
  elsif key < frequency
    deleted += frequency - key
  end
end

puts deleted
