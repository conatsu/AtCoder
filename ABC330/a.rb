# frozen_string_literal: true

N, L = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

ans = A.filter { |a| a >= L }
puts ans.size
