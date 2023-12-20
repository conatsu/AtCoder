# # frozen_string_literal: true

# N, M = gets.chomp.split.map(&:to_i)

# ans = Array.new(N, 0)

# (0..M - 1).each do
#   s, c = gets.chomp.split.map(&:to_i)
#   if N > 1 && s == 1 && c.zero?
#     puts '-1'
#     exit
#   end
#   if ans[s - 1].zero? || ans[s - 1] == c
#     ans[s - 1] = c
#   else
#     puts '-1'
#     exit
#   end
# end

# ans[0] = 1 if N > 1 && ans[0].zero?
# puts ans.join

# 下記でもOK
# frozen_string_literal: true

N, M = gets.chomp.split.map(&:to_i)
rules = []
rules << gets.chomp.split.map(&:to_i) while rules.size < M

999.times do |ans|
  s = ans.to_s
  next if s.size != N

  ok = true
  rules.each do |rule|
    ok = false if s[rule[0] - 1] != rule[1].to_s
  end
  if ok
    puts s
    exit
  end
end

puts '-1'
