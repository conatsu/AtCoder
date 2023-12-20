# frozen_string_literal: true

N = gets.chomp.to_i
numlist = gets.chomp.split.map(&:to_i)

reminders = Array.new(200, 0)

numlist.each do |num|
  reminders[num % 200] += 1
end

ans = 0
reminders.each do |reminder|
  ans += reminder * (reminder - 1) / 2
end

puts ans
