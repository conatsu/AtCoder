# frozen_string_literal: true

s = gets.chomp

i = 0
ans = ''
while i < s.size
  char = s[i]
  count = 0
  while i < s.size && s[i] == char
    count += 1
    i += 1
  end
  ans += char + count.to_s
end

puts ans
