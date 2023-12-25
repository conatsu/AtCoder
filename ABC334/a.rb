# frozen_string_literal: true

B, G = gets.chomp.split.map(&:to_i)

if B > G
  puts 'Bat'
else
  puts 'Glove'
end
