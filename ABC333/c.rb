def nth_repunit_sum(n)
  repunits = (1..12).map { |i| '1' * i }.map(&:to_i)

  unique_sums = []

  repunits.combination(3).each do |combo|
    unique_sums << combo.sum
  end

  repunits.combination(2).each do |combo|
    unique_sums << combo.sum + combo[0]
    unique_sums << combo.sum + combo[1]
  end

  repunits.each do |r|
    unique_sums << r * 3
  end

  unique_sums.uniq.sort[n - 1]
end

N = gets.chomp.to_i
puts nth_repunit_sum(N)
