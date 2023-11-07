# frozen_string_literal: true

def lower_bound(array, value)
  array.bsearch_index { |element| element >= value } || array.size
end

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i).sort
Q = gets.chomp.to_i
Q.times do
  x = gets.chomp.to_i
  puts lower_bound(Alist, x)
end
