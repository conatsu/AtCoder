def digit_sum(num)
  sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  end
  sum
end

def count_divisible_by_digit_sum(n)
  count = 0
  i = 1
  while i <= n
    digit_sum_i = digit_sum(i)
    multiplier = (n / (digit_sum_i * 10)) * 10
    start_value = multiplier * digit_sum_i + 1

    if i <= start_value
      count += [i, start_value].min + (i - start_value).abs
    else
      count += [i, start_value].min
    end

    i += 1
  end
  count
end

n = gets.chomp.to_i
ans = count_divisible_by_digit_sum(n)
puts ans
