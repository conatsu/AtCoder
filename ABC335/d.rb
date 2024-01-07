# frozen_string_literal: true

N = gets.chomp.to_i
grid = Array.new(N) { Array.new(N) }

x = 0
y = 0
dx = 1
dy = 0
value = 1

# 螺旋状に値を配置
(N * N - 1).times do
  grid[y][x] = value
  value += 1

  # 方向転換のチェック
  nx = x + dx
  ny = y + dy
  if nx.negative? || nx >= N || ny.negative? || ny >= N || grid[ny][nx]
    dx, dy = -dy, dx # 方向転換（右 -> 下 -> 左 -> 上）
    nx = x + dx
    ny = y + dy
  end

  x = nx
  y = ny
end

# 中心に 'T' を配置
grid[N / 2][N / 2] = 'T'

# グリッドの出力
grid.each { |row| puts row.join(' ') }
