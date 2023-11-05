# frozen_string_literal: true

N = gets.chomp.to_i
S = gets.chomp

def contains_consecutive_ab?(str)
  # 'ab' または 'ba' が含まれるかチェック
  !!str.match(/ab|ba/)
end

puts contains_consecutive_ab?(S) ? 'Yes' : 'No'
