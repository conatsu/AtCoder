N = gets.chomp.to_i
s = gets.chomp

# 文字列sをソート
s = s.chars.sort.join

max_value = 10**N

ans = 0

i = 0
while i * i < max_value
  t = (i * i).to_s
  t = t.ljust(N, '0') # 桁数を揃える
  t = t.chars.sort.join # 文字列をソート

  ans += 1 if s == t # 一致するか判定

  i += 1
end

puts ans
