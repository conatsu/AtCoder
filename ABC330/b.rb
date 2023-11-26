# frozen_string_literal: true

# 入力を受け取る
N, L, R = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

# 結果を格納する配列
X = [].freeze

A.each do |a_i|
  X << if a_i < L
         L
       elsif a_i > R
         R
       else
         a_i
       end
end

# 結果を出力
puts X.join(' ')
