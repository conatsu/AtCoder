# frozen_string_literal: true

n = gets.to_i
r = gets.chomp.chars
c = gets.chomp.chars
grid = []
row = Array.new(3) { [] }

def dfs(i, fl, n, r, c, row, grid)
  return if $fnd

  if i == n
    if fl.zero?
      puts 'Yes'
      grid.each { |nx| puts nx }
      $fnd = true
    end
    return
  end

  row[r[i].ord - 'A'.ord].each do |nx|
    grid.push(nx)

    ufl = fl
    und = true

    (0...n).each do |j|
      next if nx[j] == '.'

      kind = nx[j].ord - 'A'.ord

      if (fl & (1 << (4 * j + kind))).zero?
        und = false
        break
      end

      ufl ^= (1 << (4 * j + kind))

      next unless (fl & (1 << (4 * j + 3))) != 0

      if nx[j] != c[j]
        und = false
        break
      end
      ufl ^= (1 << (4 * j + 3))
    end

    dfs(i + 1, ufl, n, r, c, row, grid) if und
    grid.pop
  end
end

abc = 'ABC'
abc += '.' while abc.size < n
abc = abc.chars.permutation.to_a.sort

abc.each do |permutation|
  tg = permutation.find { |ch| ch != '.' }
  row[tg.ord - 'A'.ord].push(permutation.join)
end

dfs(0, (1 << (4 * n)) - 1, n, r, c, row, grid)

puts 'No' unless $fnd
