# frozen_string_literal: true

N = gets.chomp.to_i
alist = gets.chomp.split.map(&:to_i)

def sum_of_larger_elements(array)
  array.length
  sorted_array = array.sort
  cum_sum = sorted_array.reverse.each_with_object([]) { |x, arr| arr << x + (arr.last || 0) }.reverse

  array.map do |value|
    index = sorted_array.bsearch_index { |x| x > value }
    index ? cum_sum[index] : 0
  end
end

result = sum_of_larger_elements(alist)

puts result.join(' ')
