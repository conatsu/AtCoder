# frozen_string_literal: true

N = gets.chomp.to_i
alist = gets.chomp.split.map(&:to_i).each_with_index.map { |a, i| [a, i + 1] }
alist.sort!

puts alist[-2][1]
