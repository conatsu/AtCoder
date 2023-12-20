# frozen_string_literal: true

N, Y = gets.chomp.split.map(&:to_i)

(0..N).each do |i|
  (0..N).each do |j|
    k = N - i - j
    if i + j + k == N && 10_000 * i + 5000 * j + 1000 * k == Y
      puts "#{i} #{j} #{k}"
      exit
    end
  end
end

puts '-1 -1 -1'
