# frozen_string_literal: true

M, D = gets.chomp.split.map(&:to_i)
y, m, d = gets.chomp.split.map(&:to_i)

if m == M && d == D
  puts "#{y + 1} 1 1"
elsif d == D
  puts "#{y} #{m + 1} 1"
else
  puts "#{y} #{m} #{d + 1}"
end
