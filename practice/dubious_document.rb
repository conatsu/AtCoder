# frozen_string_literal: true

alphabet = ('a'..'z').to_a

n = gets.chomp.to_i
words = []
n.times do
  frequency_map = Hash[alphabet.zip([0] * 26)]
  gets.chomp.split('').each do |char|
    frequency_map[char] += 1
  end
  words << frequency_map
end

min_frequency_map = Hash[alphabet.zip([Float::INFINITY] * 26)]
words.each do |word|
  word.each do |key, value|
    min_frequency_map[key] = [min_frequency_map[key], value].min
  end
end

ans = ''
min_frequency_map.sort.each do |key, value|
  ans += key * value
end

puts ans
