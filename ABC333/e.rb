# frozen_string_literal: true

N = gets.chomp.to_i
events = []
N.times do
  events << gets.chomp.split(' ').map(&:to_i)
end

clearflag = true
require_potions = Hash.new { 0 }
crr = 0
ans = 0
pickup = []

events.reverse.each_with_index do |event, _i|
  if event[0] == 2
    require_potions[event[1]] += 1
    crr += 1
    ans = [ans, crr].max
  elsif event[0] == 1
    if require_potions[event[1]].positive?
      require_potions[event[1]] -= 1
      crr -= 1
      pickup << 1
    else
      pickup << 0
    end
  end
end

clearflag = false unless require_potions.values.all?(&:zero?)

if clearflag
  puts ans
  puts pickup.reverse.join(' ')
else
  puts '-1'
end
