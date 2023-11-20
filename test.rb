# frozen_string_literal: true

def factorial(n)
  (1..n).inject(1) { |product, i| product * i }
end

puts factorial(13)

target = 100_000
puts(target**(1.0 / 3))

puts 678_763_683_900_595.to_s.length
puts 936_294_041_850_197.to_s.length

puts 0.875**45
