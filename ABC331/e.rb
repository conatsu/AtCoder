N, M, L = gets.chomp.split.map(&:to_i)
alist = gets.chomp.split.map(&:to_i).each_with_index.map { |a, i| [a, i + 1] }
blist = gets.chomp.split.map(&:to_i).each_with_index.map { |b, j| [b, j + 1] }

# 禁止された組み合わせをセットで管理
forbidden_pairs = Set.new
L.times do
  c, d = gets.chomp.split.map(&:to_i)
  forbidden_pairs.add([c, d])
end

# 主菜と副菜を価格で降順にソート
alist.sort! { |x, y| y[0] <=> x[0] }
blist.sort! { |x, y| y[0] <=> x[0] }

# 最大価格の定食を探索
max_price = 0
alist.each do |a_price, a_index|
  blist.each do |b_price, b_index|
    unless forbidden_pairs.include?([a_index, b_index])
      max_price = [max_price, a_price + b_price].max
      break  # 現在の主菜で可能な最大価格を見つけたら、次の主菜に移る
    end
  end
end

puts max_price
