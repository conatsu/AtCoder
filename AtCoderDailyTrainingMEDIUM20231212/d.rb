# frozen_string_literal: true

people, count = gets.chomp.split(' ').map(&:to_i)
photos = Array.new(count) { gets.chomp.split(' ').map(&:to_i) }

people_conbinations = (1..people).to_a.combination(2).to_a

photos.each do |photo|
  photo.each_cons(2) do |a, b|
    people_conbinations.delete([a, b]) if people_conbinations.include?([a, b])
    people_conbinations.delete([b, a]) if people_conbinations.include?([b, a])
  end
end

puts people_conbinations.size
