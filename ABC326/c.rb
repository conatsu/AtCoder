# frozen_string_literal: true

N, M = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i)
alist.sort!

l = 0
r = 0
max_presents = 0

while r < N
  if alist[r] - alist[l] < M
    r += 1
  else
    l += 1
  end
  max_presents = [max_presents, r - l].max
end

puts max_presents
