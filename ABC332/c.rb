# frozen_string_literal: true

# Nが予定の長さ、Mは最初に持っている無地のTシャツの数
# 予定は1日ごとに0, 1, 2のいずれかで表される
# 0: 何もしない (Tシャツを着ない, Tシャツを洗濯する)
# 1: 食事に行く（無地のTシャツかロゴ入りのTシャツを着る）
# 2: 競技プログラミングのイベントに行く（ロゴ入りのTシャツを着る）
# 一度着用したTシャツは洗濯しない限り着用できない
# 条件を満たすようにするために何枚のTシャツを追加で購入する必要があるかを求める

N, M = gets.chomp.split.map(&:to_i)
schedule = gets.chomp.split('').map(&:to_i)

additional_shirts = 0
used_plain_shirts = 0
available_plain_shirts = M
available_logo_shirts = 0
used_logo_shirts = 0

schedule.each do |s|
  case s
  when 1
    if available_plain_shirts.positive?
      available_plain_shirts -= 1
      used_plain_shirts += 1
    elsif available_logo_shirts.positive?
      available_logo_shirts -= 1
      used_logo_shirts += 1
    else
      additional_shirts += 1
      used_logo_shirts += 1
    end
  when 2
    if available_logo_shirts.positive?
      available_logo_shirts -= 1
    else
      additional_shirts += 1
    end
    used_logo_shirts += 1
  when 0
    available_plain_shirts += used_plain_shirts
    available_logo_shirts += used_logo_shirts
    used_plain_shirts = 0
    used_logo_shirts = 0
  end
end

puts additional_shirts
