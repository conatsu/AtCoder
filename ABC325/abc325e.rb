# frozen_string_literal: true

N, A, B, C = gets.split.map(&:to_i)
D = Array.new(N) { gets.split.map(&:to_i) }

def dijukstra(start, &block)
  dist = Array.new(N, Float::INFINITY)
  dist[start] = 0
  visited = Array.new(N, false)
  visited[start] = true
  current = start
  until visited.all?
    D[current].each_with_index do |pos, i|
      next if visited[i]

      new_dist = dist[current] + block.call(pos)
      dist[i] = [new_dist, dist[i]].min
    end
    min = Float::INFINITY
    min_index = -1
    dist.each_with_index do |d, i|
      next if visited[i]

      if d < min
        min = d
        min_index = i
      end
    end
    current = min_index
    visited[current] = true
  end
  dist
end

car = dijukstra(0) { _1 * A }
train = dijukstra(N - 1) { _1 * B + C }

ans = []
N.times do |i|
  ans << car[i] + train[i]
end

puts ans.min
