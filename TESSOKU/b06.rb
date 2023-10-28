# frozen_string_literal: true

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)
Q = gets.chomp.to_i
queries = Array.new(Q) { gets.chomp.split.map(&:to_i) }

Slist = Array.new(N + 1, 0)
(1..N).each do |i|
  Slist[i] = Slist[i - 1] + Alist[i - 1]
end

queries.each do |l, r|
  if (Slist[r] - Slist[l - 1]) * 2 > r - l + 1
    puts 'win'
  elsif (Slist[r] - Slist[l - 1]) * 2 < r - l + 1
    puts 'lose'
  else
    puts 'draw'
  end
end
