# frozen_string_literal: true

h, w = gets.split.map(&:to_i)
grid = Array.new(h) { gets.chomp.chars }

# 上、下、左、右、および4つの斜め方向を表す
dirs = [[-1, 0], [1, 0], [0, -1], [0, 1], [-1, -1], [-1, 1], [1, -1], [1, 1]]

# DFS関数
def dfs(grid, x, y, h, w, dirs)
  # 現在のセルを訪問済みとしてマークする
  grid[x][y] = '.'

  # すべての可能な方向に移動する
  dirs.each do |dx, dy|
    nx = x + dx
    ny = y + dy

    # グリッドの範囲内にあり、まだ訪問されていないセンサがある場合は、そのセンサにDFSを実行する
    dfs(grid, nx, ny, h, w, dirs) if nx >= 0 && nx < h && ny >= 0 && ny < w && grid[nx][ny] == '#'
  end
end

count = 0
h.times do |i|
  w.times do |j|
    # 未訪問のセンサを見つけた場合
    next unless grid[i][j] == '#'

    # 新しい連結成分（センサグループ）を見つけたため、カウントを増やす
    count += 1
    # このセンサからDFSを開始し、連動するすべてのセンサを見つける
    dfs(grid, i, j, h, w, dirs)
  end
end

# 連動するセンサのグループの数を出力する
puts count
