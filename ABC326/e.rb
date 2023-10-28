# frozen_string_literal: true

MOD = 998_244_353

N = gets.to_i
A = gets.split.map(&:to_i)

def inverse(n, mod = MOD)
  pow(n, mod - 2)
end

def pow(a, b, mod = MOD)
  result = 1
  while b.positive?
    result = result * a % mod if b & 1 == 1
    a = a * a % mod
    b >>= 1
  end
  result
end

total = 0
N.times do |x|
  N.times do |j|
    total += (N - x) * A[j] % MOD
    total %= MOD
  end
end

puts total * inverse(N) % MOD * inverse(N) % MOD
