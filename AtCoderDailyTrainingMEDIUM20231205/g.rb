N = gets.chomp.to_i

# 初期化
$s = ["0"] + ["*"] * (N - 2) + ["1"]

def find_different_adjacent(low, high)
  # lowとhighの間に異なる隣接する値があるかどうかをチェック
  while low <= high
    mid = (low + high) / 2
    if $s[mid] == "*"
      puts "? #{mid + 1}"
      STDOUT.flush
      $s[mid] = gets.chomp
    end

    if mid > 0 && $s[mid] != $s[mid - 1] && $s[mid - 1] != "*"
      return mid # midとmid-1が異なる場合、そのインデックスを返す
    end

    if mid < N - 1 && $s[mid] != $s[mid + 1] && $s[mid + 1] != "*"
      return mid + 1 # midとmid+1が異なる場合、そのインデックスを返す
    end

    if $s[mid] == "0"
      low = mid + 1
    else
      high = mid - 1
    end
  end

  -1 # 異なる隣接する値が見つからない場合
end

# メイン処理
result_index = find_different_adjacent(0, N - 1)

if result_index != -1
  puts "! #{result_index}"
  STDOUT.flush
end
