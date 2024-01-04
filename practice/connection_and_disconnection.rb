# frozen_string_literal: true

S = gets.chomp
K = gets.chomp.to_i
s2 = S * 2

def count_operations(str)
  count = 0
  i = 0
  while i < str.size - 1
    j = i + 1
    j += 1 while j < str.size && str[i] == str[j]
    count += (j - i) / 2
    i = j
  end
  count
end

operations_s = count_operations(S)
operations_s2 = count_operations(s2)

if K == 1
  puts operations_s
elsif S.chars.uniq.size == 1
  puts S.size * K / 2
elsif S[0] != S[-1]
  puts operations_s * K
else
  puts operations_s + (operations_s2 - operations_s) * (K - 1)
end
