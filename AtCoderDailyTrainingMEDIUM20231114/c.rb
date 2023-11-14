# frozen_string_literal: true

N = gets.chomp.to_i
Slist = [].freeze
N.times do
  Slist << gets.chomp
end
ansHash = {}
Slist.each do |s|
  ansHash[s] = 0 if ansHash[s].nil?
  ansHash[s] += 1
end

ans = ansHash.max_by { |_key, value| value }[0]
puts ans
