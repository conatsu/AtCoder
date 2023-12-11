# frozen_string_literal: true

K, G, M = gets.split.map(&:to_i)
glass = 0
magcup = 0

K.times do
  if glass == G
    glass = 0
  elsif magcup.zero?
    magcup = M
  else
    transfer = [G - glass, magcup].min
    glass += transfer
    magcup -= transfer
  end
end

puts "#{glass} #{magcup}"
