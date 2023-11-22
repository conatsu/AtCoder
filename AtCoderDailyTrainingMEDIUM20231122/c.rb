N, K = gets.chomp.split.map(&:to_i)
S = gets.chomp.split('')

count = 0
ans = []
S.each do |s|
  if s == 'o' && count < K
    count += 1
    ans << 'o'
  else
    ans << 'x'
  end
end

puts ans.join
