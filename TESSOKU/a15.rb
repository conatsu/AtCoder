# frozen_string_literal: true

N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)

uniq_sorted_list = Alist.uniq.sort
ans = []
Alist.each do |a|
  ans << uniq_sorted_list.bsearch_index { |x| x >= a } + 1
end

puts ans.join(' ')
