# frozen_string_literal: true

N = gets.chomp.to_i

(N..919).each do |i|
  str_i = i.to_s
  if str_i[0].to_i * str_i[1].to_i == str_i[2].to_i
    puts i
    break
  end
end
