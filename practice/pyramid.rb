# frozen_string_literal: true

N = gets.chomp.to_i
hints = []

N.times do
  hints << gets.chomp.split.map(&:to_i)
end

101.times do |x|
  101.times do |y|
    h = 0
    hints.each do |hint|
      next if hint[2].zero?

      h = hint[2] + (x - hint[0]).abs + (y - hint[1]).abs
      break
    end
    ok = true
    hints.each do |hint|
      ok = false if hint[2] != [h - (x - hint[0]).abs - (y - hint[1]).abs, 0].max
    end
    if ok
      puts "#{x} #{y} #{h}"
      exit
    end
  end
end
