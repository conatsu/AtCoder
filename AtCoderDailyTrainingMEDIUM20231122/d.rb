# frozen_string_literal: true

S = gets.chomp.split('')
T = gets.chomp.split('')

k = (T[0].ord - S[0].ord) % 26

(1...S.length).each do |i|
  if (T[i].ord - S[i].ord) % 26 != k
    puts 'No'
    exit
  end
end

puts 'Yes'
