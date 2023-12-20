# frozen_string_literal: true

N = gets.chomp.to_i
ateam = gets.chomp.split.map(&:to_i)
bteam = gets.chomp.split.map(&:to_i)
cteam = gets.chomp.split.map(&:to_i)

a_hash = Hash.new(0)
b_hash = Hash.new(0)
c_hash = Hash.new(0)

ateam.each do |num|
  a_hash[num % 46] += 1
end

bteam.each do |num|
  b_hash[num % 46] += 1
end

cteam.each do |num|
  c_hash[num % 46] += 1
end

ans = 0
a_hash.each do |a_key, a_value|
  b_hash.each do |b_key, b_value|
    c_hash.each do |c_key, c_value|
      ans += a_value * b_value * c_value if ((a_key + b_key + c_key) % 46).zero?
    end
  end
end

puts ans
