N = gets.chomp.to_i
alist = gets.chomp.split(' ').map(&:to_i)
is_all_same = alist.uniq.length <= 1
if is_all_same
  puts 'Yes'
else
  puts 'No'
end
