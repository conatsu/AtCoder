# frozen_string_literal: true

N = gets.chomp.to_i

ans = N.to_s(2).rjust(10, '0')
puts ans
