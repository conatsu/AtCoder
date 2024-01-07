# frozen_string_literal: true

N, Q = gets.chomp.split.map(&:to_i)

# 龍の頭の初期位置
head_x = 1
head_y = 0

# 龍の全体の動きを記録するキュー
moves = []

Q.times do
  query = gets.chomp.split
  type = query[0].to_i

  if type == 1
    # 龍の頭を動かすクエリ
    direction = query[1]

    # 頭の移動方向を記録
    case direction
    when 'R'
      head_x += 1
    when 'L'
      head_x -= 1
    when 'U'
      head_y += 1
    when 'D'
      head_y -= 1
    end

    # 動きをキューに追加
    moves << [head_x, head_y]

    # キューがNを超えたら古い動きを削除
    moves.shift if moves.size > N
  elsif type == 2
    # 特定のパーツの位置を問い合わせるクエリ
    p = query[1].to_i

    # 計算されたパーツの位置
    if p > moves.size
      # 動きのキューにないパーツの場合、初期位置からの相対位置を計算
      puts "#{p - moves.size} 0"
    else
      # キューに存在するパーツの場合、記録された位置を出力
      puts "#{moves[-p][0]} #{moves[-p][1]}"
    end
  end
end
