# frozen_string_literal: true

class PriorityQueue
  def initialize
    @heap = []
  end

  def push(item)
    @heap << item
    sift_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?

    swap(0, @heap.size - 1)
    root = @heap.pop
    sift_down(0) unless @heap.empty?
    root
  end

  def peek
    @heap.first
  end

  def empty?
    @heap.empty?
  end

  private

  def sift_up(index)
    parent = (index - 1) / 2

    return if index <= 0 || @heap[parent] <= @heap[index]

    swap(index, parent)
    sift_up(parent)
  end

  def sift_down(index)
    child = index * 2 + 1

    return if child >= @heap.size

    not_the_last_item = child < @heap.size - 1
    left_child_smaller_than_right = not_the_last_item && @heap[child] > @heap[child + 1]
    child += 1 if left_child_smaller_than_right

    return if @heap[index] <= @heap[child]

    swap(index, child)
    sift_down(child)
  end

  def swap(i, j)
    @heap[i], @heap[j] = @heap[j], @heap[i]
  end
end

n = gets.to_i
v = []

n.times do
  t, d = gets.split.map(&:to_i)
  v.push([t, t + d])
end

v.sort_by! { |entry, exit| [entry, exit] }

pq = PriorityQueue.new
it = 0
ans = 0
i = 0

loop do
  if pq.empty?
    break if it == n

    i = [i, v[it][0]].max
  end

  while (it < n) && (v[it][0] == i)
    pq.push(v[it][1])
    it += 1
  end

  pq.pop while !pq.empty? && (pq.peek < i)

  unless pq.empty?
    pq.pop
    ans += 1
  end

  i += 1 unless pq.empty?
end

puts ans
