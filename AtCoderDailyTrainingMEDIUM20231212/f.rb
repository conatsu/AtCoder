# frozen_string_literal: true

def rotate(grid)
  grid.transpose.map(&:reverse)
end

def extract_shape(grid)
  top = grid.find_index { |row| row.include?('#') }
  bottom = grid.rindex { |row| row.include?('#') }
  left = grid.map { |row| row.include?('#') ? row.find_index('#') : nil }.compact.min
  right = grid.map { |row| row.include?('#') ? row.rindex('#') : nil }.compact.max

  grid[top..bottom].map { |row| row[left..right] }
end

def can_transform?(s, t)
  s_shape = extract_shape(s)
  t_shape = extract_shape(t)

  4.times do
    return true if s_shape == t_shape

    s_shape = rotate(s_shape)
  end
  false
end

def read_grid(n)
  Array.new(n) { gets.chomp.chars }
end

n = gets.to_i
s = read_grid(n)
t = read_grid(n)

puts can_transform?(s, t) ? 'Yes' : 'No'
