# frozen_string_literal: true

N = gets.chomp.to_i
grid = Array.new(N) { gets.chomp.split('') }

# 各行と各列の o の数をカウント
row_count = Array.new(N, 0)
col_count = Array.new(N, 0)
grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cell == 'o'
      row_count[i] += 1
      col_count[j] += 1
    end
  end
end

# 三つ組のカウント
count = 0
grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    if cell == 'o'
      # 同じ行または列に他にもう1つ o がある場合にのみカウント
      count += (row_count[i] - 1) * (col_count[j] - 1)
    end
  end
end

puts count
