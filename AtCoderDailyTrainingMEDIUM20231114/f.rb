N, M = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

dateList = Array.new(N + 1, 0)
Alist.each do |a|
  dateList[a] += 1
end

(1..N).each do |i|
  if dateList[i].zero?
    a = Alist.bsearch { |a| a > i }
    puts a - i
  else
    puts 0
  end
end
