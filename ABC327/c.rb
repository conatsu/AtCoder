# frozen_string_literal: true

table = []
9.times do
  table << gets.chomp.split.map(&:to_i)
end

def check_row(table)
  table.each do |row|
    return false if row.uniq.size != 9
  end
  true
end

def check_column(table)
  table.transpose.each do |column|
    return false if column.uniq.size != 9
  end
  true
end

def check_square(table)
  3.times do |i|
    3.times do |j|
      square = []
      3.times do |k|
        3.times do |l|
          square << table[i * 3 + k][j * 3 + l]
        end
      end
      return false if square.uniq.size != 9
    end
  end
  true
end

if check_row(table) && check_column(table) && check_square(table)
  puts 'Yes'
else
  puts 'No'
end
