# frozen_string_literal: true

N = gets.chomp.to_i
ans = 0

(1..N + 1).each do |a|
  break if a * a * a > N

  (a..N + 1).each do |b|
    break if a * b * b > N

    ans += N / (a * b) - b + 1
  end
end

puts ans
