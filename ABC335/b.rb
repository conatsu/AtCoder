# frozen_string_literal: true

N = gets.chomp.to_i

(0..N).each do |i|
  (0..N).each do |j|
    (0..N).each do |k|
      puts "#{i} #{j} #{k}" if i + j + k <= N
    end
  end
end
