# frozen_string_literal: true

N, K = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)
Blist = gets.chomp.split.map(&:to_i)

max_deliciousness = Alist.max
indices = Alist.each_with_index.select { |num, _idx| num == max_deliciousness }.map(&:last)

indices.each do |i|
  if Blist.include?(i + 1)
    puts 'Yes'
    exit
  end
end

puts 'No'
