# frozen_string_literal: true

N = gets.chomp.to_i
s = []
t = []
N.times do
  u, v = gets.chomp.split
  s << u
  t << v
end

N.times do |i|
  can_give_a_nickname = false
  [s[i], t[i]].each do |a|
    s_ok = true
    N.times do |j|
      if i != j && (a == s[j] || a == t[j])
        s_ok = false
        break
      end
    end
    can_give_a_nickname = true if s_ok
  end

  unless can_give_a_nickname
    puts 'No'
    exit
  end
end

puts 'Yes'
