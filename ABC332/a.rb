# frozen_string_literal: true

N, S, K = gets.split.map(&:to_i)
sum = 0
N.times do
  price, quantity = gets.split.map(&:to_i)
  sum += price * quantity
end

if sum >= S
  puts sum
else
  puts sum + K
end
