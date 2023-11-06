# frozen_string_literal: true

N = gets.to_i
S = gets.chomp.chars.map(&:to_i).tally
max = Math.sqrt(S.map { [_1] * _2 }.sort.reverse.join.to_i).to_i
min = Math.sqrt(S.map { [_1] * _2 }.sort.join.to_i).to_i

ans = 0
i = min
while i <= max
  t = (i * i).digits
  n = t.size
  t = t.tally
  t[0] = t.fetch(0, 0) + N - n if n < N
  ans += 1 if t == S
  i += 1
end
puts ans
