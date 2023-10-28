# frozen_string_literal: true

X, Y = gets.chomp.split.map(&:to_i)
if X > Y
  if X - Y <= 3
    puts 'Yes'
  else
    puts 'No'
  end
elsif Y - X <= 2
  puts 'Yes'
else
  puts 'No'
end
