S = gets.chomp
index = 1

S.each_char do |c|
  if index.even? && (c != '0')
    puts 'No'
    exit
  end
  index += 1
end

puts 'Yes'
