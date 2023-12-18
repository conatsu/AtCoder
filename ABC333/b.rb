def distance_equal(p1, p2)
  positions = { 'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4, 'E' => 5 }
  num1 = positions[p1]
  num2 = positions[p2]

  diff = (num1 - num2).abs
  [1, 4].include?(diff)
end

def is_equal_length(seg1, seg2)
  s1, s2 = seg1.split('')
  t1, t2 = seg2.split('')

  distance_equal(s1, s2) == distance_equal(t1, t2)
end

ss = gets.chomp
tt = gets.chomp

puts is_equal_length(ss, tt) ? 'Yes' : 'No'
