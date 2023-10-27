# frozen_string_literal: true

A, B = gets.chomp.split.map(&:to_i)

(A..B).each do |i|
  if (100 % i).zero?
    puts 'Yes'
    exit
  end
end

puts 'No'
