n = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

had_book = Array.new(n + 2, false)
A.each do |a|
    had_book[[n + 1, a].min] = true
end

read = 0
while n >= 0
    read += 1
    if had_book[read]
        n -= 1
    else
        n -= 2
    end
end

puts read - 1