# frozen_string_literal: true

n = gets.chomp.to_i
loop do
  break unless n.even?

  n /= 2
end
loop do
  break unless (n % 3).zero?

  n /= 3
end

if n == 1
  puts 'Yes'
else
  puts 'No'
end
