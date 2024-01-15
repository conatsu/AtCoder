# frozen_string_literal: true

def count_trailing_zeros(num)
  binary = num.to_s(2)
  binary.reverse.match(/^0*/)[0].length
end

N = gets.chomp.to_i

puts count_trailing_zeros(N)
