# frozen_string_literal: true

N, X = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i).sort

low = 0
high = N - 1
while low <= high
  mid = (low + high) / 2
  if alist[mid] == X
    puts mid + 1
    exit
  elsif alist[mid] > X
    high = mid - 1
  else
    low = mid + 1
  end
end

puts(-1)

# bsearch_indexを使う場合
# puts alist.bsearch_index { |x| x <=> X } || -1
