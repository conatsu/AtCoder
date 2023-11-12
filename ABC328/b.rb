# frozen_string_literal: true

N = gets.chomp.to_i
Dlist = gets.chomp.split.map(&:to_i)

ans = 0
now = 1
Dlist.each do |d|
  (1..d).each do |i|
    # 月と日がゾロ目かどうかをチェック
    if i.to_s.chars.uniq.length == 1 && now.to_s.chars.uniq.length == 1 && i.to_s.chars.uniq.first == now.to_s.chars.uniq.first
      ans += 1
    end
  end
  now += 1
end

puts ans
