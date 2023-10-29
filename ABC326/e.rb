# frozen_string_literal: true

mod = 998_244_353
n = gets.to_i
a = gets.split.map(&:to_i)

p = n.pow(mod - 2, mod)
q = 1 + n.pow(mod - 2, mod)
res = 0

a.each do |v|
  res = (res + p * v) % mod
  p = (p * q) % mod
end

puts res
