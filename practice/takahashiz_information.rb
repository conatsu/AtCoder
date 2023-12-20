# frozen_string_literal: true

grid = []
3.times do
  grid << gets.chomp.split.map(&:to_i)
end

101.times do |a1|
  101.times do |a2|
    101.times do |a3|
      b1 = grid[0][0] - a1
      b2 = grid[0][1] - a1
      b3 = grid[0][2] - a1
      c1 = grid[1][0] - a2
      c2 = grid[1][1] - a2
      c3 = grid[1][2] - a2
      d1 = grid[2][0] - a3
      d2 = grid[2][1] - a3
      d3 = grid[2][2] - a3
      if b1 == c1 && c1 == d1 && b2 == c2 && c2 == d2 && b3 == c3 && c3 == d3
        puts 'Yes'
        exit
      end
    end
  end
end

puts 'No'
