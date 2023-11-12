# frozen_string_literal: true

N, X = gets.chomp.split.map(&:to_i)
Slist = gets.chomp.split.map(&:to_i)

ans = Slist.filter { |s| s <= X }.inject(0) { |acc, s| acc + s }
puts ans
