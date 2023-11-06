# frozen_string_literal: true

def factorial(n)
  (1..n).inject(1) { |product, i| product * i }
end

puts factorial(13)
