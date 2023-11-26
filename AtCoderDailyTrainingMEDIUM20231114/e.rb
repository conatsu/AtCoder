# frozen_string_literal: true

H, W = gets.chomp.split.map(&:to_i)
grid = Array.new(H) { gets.chomp.split('') }

visited = Array.new(H) { Array.new(W, false) }

i = 0
j = 0
current = grid[i][j]
infiniteloop = false

loop do
  visited[i][j] = true
  if current == 'U' && i != 0
    i -= 1
  elsif current == 'D' && i != H - 1
    i += 1
  elsif current == 'L' && j != 0
    j -= 1
  elsif current == 'R' && j != W - 1
    j += 1
  else
    break
  end

  if visited[i][j]
    infiniteloop = true
    break
  end

  current = grid[i][j]
end

if infiniteloop
  puts(-1)
else
  puts "#{i + 1} #{j + 1}"
end
