# frozen_string_literal: true

def find_nth_number(num)
  base5 = num.to_s(5)

  result = base5.chars.map { |digit| digit.to_i * 2 }.join

  result.to_i
end

N = gets.chomp.to_i

puts find_nth_number(N - 1)
