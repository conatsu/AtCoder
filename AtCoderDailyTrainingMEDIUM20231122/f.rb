N = gets.chomp.to_i

ans = 0
(1..N).each do |i|
  break if i**3 > N

  (i..N).each do |j|
    break if i * j**2 > N

    ans += N / i / j - j + 1
  end
end

puts ans
