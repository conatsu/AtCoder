# frozen_string_literal: true

A, B, C, D = gets.chomp.split.map(&:to_i)

def is_prime(num)
  return false if num < 2

  (2..Math.sqrt(num)).each do |i|
    return false if (num % i).zero?
  end
  true
end

is_win = false
(A..B).each do |i|
  (C..D).each do |j|
    break if is_prime(i + j)

    is_win = true if j == D
  end
end

puts is_win ? 'Takahashi' : 'Aoki'
