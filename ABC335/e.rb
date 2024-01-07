# frozen_string_literal: true

# 以下のコードではTLEになる

N, M = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i)
edges = M.times.map { gets.chomp.split.map(&:to_i) }

# グラフの隣接リスト表現を作成
graph = Array.new(N) { [] }
edges.each do |u, v|
  u -= 1
  v -= 1
  graph[u] << v
  graph[v] << u
end

# DFSを用いて最大得点を探索
def dfs(graph, alist, current, last_value, visited, score)
  return score if current == graph.size - 1

  visited[current] = true
  max_score = 0

  graph[current].each do |neighbor|
    next if visited[neighbor]
    next if alist[neighbor] < last_value

    new_score = score
    new_score += 1 if alist[neighbor] > last_value
    max_score = [max_score, dfs(graph, alist, neighbor, alist[neighbor], visited, new_score)].max
  end

  visited[current] = false
  max_score
end

visited = Array.new(N, false)
puts dfs(graph, alist, 0, alist[0], visited, 1)
