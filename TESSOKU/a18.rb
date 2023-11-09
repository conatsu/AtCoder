N, S = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

dp = Array.new(N + 1) { Array.new(S + 1, false) }
dp[0][0] = true

(1..N).each do |i|
  (0..S).each do |j|
    dp[i][j] = dp[i - 1][j] # Alist[i-1] を選ばない場合
    if j >= Alist[i-1]
      dp[i][j] ||= dp[i - 1][j - Alist[i-1]] # Alist[i-1] を選ぶ場合
    end
  end
end

puts dp[N][S] ? "Yes" : "No"
