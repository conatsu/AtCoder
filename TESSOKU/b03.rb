# frozen_string_literal: true

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)

combinations = Alist.combination(3).to_a
if combinations.any? { |a, b, c| a + b + c == 1000 }
  puts 'Yes'
else
  puts 'No'
end
