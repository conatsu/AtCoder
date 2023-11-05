# frozen_string_literal: true

N, M = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i)
blist = gets.chomp.split.map(&:to_i)

def can_create_sequence(_n, m, s, t)
  graph = {}
  colors = {}

  # グラフを構築する
  m.times do |i|
    graph[s[i]] ||= []
    graph[t[i]] ||= []
    graph[s[i]].push(t[i])
    graph[t[i]].push(s[i])
  end

  # 2彩色問題を解くためのDFS
  def dfs(node, color, graph, colors)
    return false if colors[node] && colors[node] != color
    return true if colors[node]

    colors[node] = color
    graph[node].each do |neighbour|
      return false unless dfs(neighbour, 1 - color, graph, colors)
    end
    true
  end

  # 各連結成分に対してDFSを実行
  graph.each_key do |node|
    next if colors[node]
    return false unless dfs(node, 0, graph, colors)
  end

  true
end

puts can_create_sequence(N, M, alist, blist) ? 'Yes' : 'No'
