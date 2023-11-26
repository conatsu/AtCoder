# frozen_string_literal: true

require 'set'

N, Q = gets.chomp.split.map(&:to_i)
boxes = Array.new(N + 1) { Set.new }
c = gets.chomp.split.map(&:to_i)

c.each_with_index do |ci, i|
  boxes[i + 1].add(ci)
end

Q.times do
  a, b = gets.chomp.split.map(&:to_i)

  if boxes[a].size < boxes[b].size
    boxes[b].merge(boxes[a])
  else
    boxes[a].merge(boxes[b])
    boxes[a], boxes[b] = boxes[b], boxes[a]
  end

  boxes[a].clear
  puts boxes[b].size
end
