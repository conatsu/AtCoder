# frozen_string_literal: true

B = gets.chomp.to_i

def find_integer_a_for_power(b)
  low = 1
  high = [b, 1_000_000].min  # 10^18の平方根は高々10^6なので、その値を上限とする
  while low <= high
    mid = low + (high - low) / 2
    power = mid**mid
    return mid if power == b

    if power < b
      low = mid + 1
    else
      high = mid - 1
    end
  end
  -1
end

puts find_integer_a_for_power(B)
