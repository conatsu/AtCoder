n = gets.to_i
mp = {}

n.times do
  x, y = gets.split.map(&:to_i)
  while (x & 1) == 0  # xが偶数の間、繰り返す
    x >>= 1  # xを2で割る (右シフト)
    y <<= 1  # yを2倍する (左シフト)
  end
  mp[x] = 0 unless mp.key?(x)
  mp[x] += y
end

ans = 0

mp.each_value do |value|
  y = value
  while y > 0
    ans += 1 if y & 1 == 1 # yが奇数ならansを1増やす
    y >>= 1  # yを2で割る (右シフト)
  end
end

puts ans
