N, K = gets.chomp.split(' ').map(&:to_i)

ans = 0
(1..N).each do |i|
    (1..N).each do |j|
        k = K - i - j
        if k >= 1 && k <= N
            ans += 1
        end
    end
end

puts ans
