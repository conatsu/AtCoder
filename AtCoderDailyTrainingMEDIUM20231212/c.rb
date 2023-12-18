# frozen_string_literal: true

password = gets.chomp.split('').map(&:to_i)

if password.uniq.size == 1
  puts 'Weak'
  exit
end

if password.each_cons(2).all? { |a, b| (a + 1) % 10 == b }
  puts 'Weak'
  exit
end

puts 'Strong'
