N = gets.chomp.to_i
Alist = gets.chomp.split.map(&:to_i)

indices = Hash.new { |h, k| h[k] = [] }
Alist.each_with_index do |a, i|
  indices[a] << i
end

Q = gets.chomp.to_i
Q.times do
  l, r, x = gets.chomp.split.map(&:to_i)
  l -= 1
  r -= 1

  if indices[x].empty?
    puts 0
  else
    left = indices[x].bsearch_index { |i| i >= l } || indices[x].length
    right = indices[x].bsearch_index { |i| i > r } || indices[x].length
    puts right - left
  end
end
