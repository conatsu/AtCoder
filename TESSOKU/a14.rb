# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)
Blist = gets.chomp.split.map(&:to_i)
Clist = gets.chomp.split.map(&:to_i)
Dlist = gets.chomp.split.map(&:to_i)

ablist = Alist.product(Blist).map { |a, b| a + b }.sort
cdlist = Clist.product(Dlist).map { |c, d| c + d }.sort

found = ablist.any? do |ab|
  cdlist.bsearch { |cd| K - ab <=> cd }
end

puts found ? 'Yes' : 'No'
