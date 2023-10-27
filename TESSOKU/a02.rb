# frozen_string_literal: true

N, X = gets.chomp.split(' ').map(&:to_i)
a_list = gets.chomp.split(' ').map(&:to_i)

if a_list.include?(X)
  puts 'Yes'
else
  puts 'No'
end
