# frozen_string_literal: true

F_0 = 1
@memo = {}

def f(n)
  return F_0 if n.zero?

  @memo[n] ||= f(n / 2) + f(n / 3)
end

N = gets.chomp.to_i
puts f(N)
