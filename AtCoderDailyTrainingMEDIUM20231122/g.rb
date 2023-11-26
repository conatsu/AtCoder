# frozen_string_literal: true

S = gets.chomp.split('').map(&:to_i)

acc_xor = Array.new(S.size + 1, 0)
S.each_with_index do |num, i|
  acc_xor[i + 1] = acc_xor[i] ^ (1 << num)
end

counter = Hash.new(0)
acc_xor.each { |x| counter[x] += 1 }

ans = 0
counter.each_value { |val| ans += val * (val - 1) / 2 }

puts ans
