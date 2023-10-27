N, Q = gets.chomp.split(' ').map(&:to_i)
A = gets.chomp.split(' ').map(&:to_i)

# 累積和の計算
cumulative_sum = [0]
N.times do |i|
    cumulative_sum << cumulative_sum[i] + A[i]
end

Q.times do
    l, r = gets.chomp.split(' ').map(&:to_i)
    # 区間[l, r]の合計を累積和を使って計算
    ans = cumulative_sum[r] - cumulative_sum[l - 1]
    puts ans
end
