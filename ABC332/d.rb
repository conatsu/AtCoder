# frozen_string_literal: true

inf = Float::INFINITY

h, w = gets.chomp.split.map(&:to_i)
a = Array.new(h) { gets.chomp.split(' ').map(&:to_i) }
b = Array.new(h) { gets.chomp.split(' ').map(&:to_i) }

ans = inf
(1..h).to_a.permutation.each do |hp|
  (1..w).to_a.permutation.each do |wp|
    match = true
    (0...h).each do |i|
      (0...w).each do |j|
        match = false if a[hp[i] - 1][wp[j] - 1] != b[i][j]
      end
    end
    next unless match

    pinv = 0
    (1..h).each do |i|
      (i + 1..h).each do |j|
        pinv += 1 if hp[i - 1] > hp[j - 1]
      end
    end

    qinv = 0
    (1..w).each do |i|
      (i + 1..w).each do |j|
        qinv += 1 if wp[i - 1] > wp[j - 1]
      end
    end

    ans = [ans, pinv + qinv].min
  end
end

puts ans == inf ? -1 : ans
