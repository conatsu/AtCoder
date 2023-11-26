# frozen_string_literal: true

require 'ac-library-rb/segtree'

INF = 10**20
ADD = 1_000_000
N, Q = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i)

segtree = AcLibraryRb::Segtree.new(N + 1, INF) { |x, y| [x, y].min }
(N + 1).times do |i|
  segtree.set(i, i)
end

alist.each do |a|
  segtree.set(a, segtree.get(a) + ADD) if a < N
end

Q.times do
  i, x = gets.split.map(&:to_i)
  i -= 1

  y = alist[i]
  segtree.set(y, segtree.get(y) - ADD) if y >= 0 && y < N
  alist[i] = x
  segtree.set(x, segtree.get(x) + ADD) if x < N
  puts segtree.all_prod
end

# 以下だとTLE
# N, Q = gets.chomp.split.map(&:to_i)
# a = gets.chomp.split.map(&:to_i)

# counts = Hash.new(0)
# a.each { |num| counts[num] += 1 }

# mex = 0
# mex += 1 while counts[mex] > 0

# Q.times do
#     i, x = gets.split.map(&:to_i)
#     i -= 1 # 0から始まるインデックスに合わせる

#     counts[a[i]] -= 1
#     mex = a[i] if counts[a[i]] == 0 && a[i] < mex

#     a[i] = x
#     counts[x] += 1

#     mex += 1 while counts[mex] > 0

#     puts mex
# end
