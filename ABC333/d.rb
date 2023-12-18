# frozen_string_literal: true

require 'set'

# Disjoint Set Union
class DSU
  def initialize(n)
    @parent = (0...n).to_a
  end

  def find(x)
    x == @parent[x] ? x : (@parent[x] = find(@parent[x]))
  end

  def union(x, y)
    x_root = find(x)
    y_root = find(y)
    @parent[x_root] = y_root
  end

  def groups
    groups = Hash.new { |h, k| h[k] = [] }
    @parent.each_with_index { |p, i| groups[find(p)] << i }
    groups.values
  end
end

N = gets.chomp.to_i
forest = DSU.new(N)

(N - 1).times do
  u, v = gets.chomp.split.map(&:to_i)
  forest.union(u - 1, v - 1) if u != 1
end

group_sizes = forest.groups.map(&:size)
max_group_size = group_sizes.max

puts N - max_group_size
