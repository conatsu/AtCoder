# frozen_string_literal: true

N = gets.chomp.to_i
grid = []
N.times do
  grid << gets.chomp.split('').map(&:to_i)
end

# 8方向の移動
dx = [1, 1, 1, 0, 0, -1, -1, -1]
dy = [1, 0, -1, 1, -1, 1, 0, -1]

max_value = 0

N.times do |start_x|
  N.times do |start_y|
    8.times do |direction|
      now = 0
      x = start_x
      y = start_y
      N.times do
        now *= 10
        now += grid[x][y].to_i
        x += dx[direction]
        y += dy[direction]
        x %= N
        x += N
        y %= N
        y += N
        x %= N
        y %= N
      end
      max_value = [max_value, now].max
    end
  end
end

puts max_value
