# frozen_string_literal: true

def g(x, y)
  return $precalc[x][y] if (x <= $n) && (y <= $n)

  xq = x / $n
  xr = x % $n
  yq = y / $n
  yr = y % $n
  ret = 0
  ret += g($n, $n) * xq * yq
  ret += g($n, yr) * xq
  ret += g(xr, $n) * yq
  ret += g(xr, yr)
  ret
end

def f(a, b, c, d)
  g(c, d) - g(a, d) - g(c, b) + g(a, b)
end

$n, q = gets.chomp.split.map(&:to_i)
p = []
$n.times do
  p << gets.chomp
end
queries = []

q.times do
  a, b, c, d = gets.chomp.split.map(&:to_i)
  queries << [a, b, c, d]
end

$precalc = Array.new($n + 1) { Array.new($n + 1, 0) }

(1..$n).each do |i|
  (1..$n).each do |j|
    $precalc[i][j] += p[i - 1][j - 1] == 'B' ? 1 : 0
    $precalc[i][j] += $precalc[i - 1][j] + $precalc[i][j - 1] - $precalc[i - 1][j - 1]
  end
end

queries.each do |query|
  a, b, c, d = query
  puts f(a, b, c + 1, d + 1)
end
