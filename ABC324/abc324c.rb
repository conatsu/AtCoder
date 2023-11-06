# frozen_string_literal: true

input = gets.chomp.split(' ')
N = input[0].to_i
tdash = input[1]
slist = []
ans = []
N.times do
  slist << gets.chomp
end

def is_same(t, t_prime)
  return true if t == t_prime

  false
end

def is_one_char_added(t, t_prime)
  return false unless t.length == t_prime.length - 1

  diff_index = 0
  diff_index += 1 while diff_index < t.length && t[diff_index] == t_prime[diff_index]

  t[diff_index..] == t_prime[diff_index + 1..]
end

def is_one_char_removed(t, t_prime)
  return false unless t.length == t_prime.length + 1

  diff_index = 0
  diff_index += 1 while diff_index < t_prime.length && t[diff_index] == t_prime[diff_index]

  t[diff_index + 1..] == t_prime[diff_index..]
end

def is_one_char_changed(t, t_prime)
  return false unless t.length == t_prime.length

  diff_count = t.each_char.zip(t_prime.each_char).count { |char1, char2| char1 != char2 }

  diff_count == 1
end

def solve(t, t_prime)
  if is_same(t, t_prime) || is_one_char_added(t, t_prime) ||
     is_one_char_removed(t, t_prime) || is_one_char_changed(t, t_prime)
    return true
  end

  false
end

slist.each_with_index do |s, index|
  next unless solve(s, tdash)

  ans << index + 1
end

puts ans.length
puts ans.join(' ')
