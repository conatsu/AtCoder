# frozen_string_literal: true

D = gets.chomp.to_i

min = 10**9
(1..(D**0.5).to_i).each do |i|
  j = Math.sqrt(D - i**2).round
  diff = (i**2 + j**2 - D).abs
  min = diff if diff < min
end

puts min
