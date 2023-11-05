# frozen_string_literal: true

def calculate_rate(performances)
  n = performances.size
  dp = Array.new(n + 1, 0.0)
  w = 0.0
  ans = -1200.0
  decay = 0.9

  performances.each_with_index do |performance, i|
    dp[i + 1] = decay * dp[i] + performance
    j = i - 1
    while j >= 0
      dp[j + 1] = [decay * dp[j] + performance, dp[j + 1]].max
      j -= 1
    end
  end

  (1..n).each do |i|
    w = decay * w + 1.0
    ans = [ans, dp[i] / w - 1200.0 / Math.sqrt(i)].max
  end

  ans
end

# Main execution
gets.to_i
performances = gets.split.map(&:to_f)
max_rate = calculate_rate(performances)

# 結果の出力
puts format('%.10f', max_rate)
