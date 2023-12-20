# frozen_string_literal: true

N = gets.chomp.to_i
mochilist = []
N.times do
  mochilist << gets.chomp.to_i
end

puts mochilist.uniq.size
