# frozen_string_literal: true

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

start = 0
stop = 1
ans = 0
while start < N
  # 数列の増減を判定するためのフラグ
  increasing = nil

  while stop < N
    if A[stop - 1] < A[stop]
      # 単調増加
      break if increasing == false

      increasing = true
    elsif A[stop - 1] > A[stop]
      # 単調減少
      break if increasing == true

      increasing = false
    end
    stop += 1
  end

  ans += 1
  start = stop
  stop += 1
end

puts ans
