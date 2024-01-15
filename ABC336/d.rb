# frozen_string_literal: true

N = gets.chomp.to_i
a = gets.chomp.split.map(&:to_i)

f = lambda do |array|
  u = 0
  array.map { u = [u + 1, _1].min }
end

l = f[a]
r = f[a.reverse].reverse
puts l.zip(r).map { |x, y| [x, y].min }.max
