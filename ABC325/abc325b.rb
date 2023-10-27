n = gets.to_i
base_data = []

n.times do
  w, x = gets.split.map(&:to_i)
  base_data << { employees: w, timezone: x }
end

# 各拠点の勤務時間（UTC）とその拠点の社員数を計算
availability = []
base_data.each do |data|
  start_time = (9 - data[:timezone]) % 24 # 日をまたぐ場合を考慮
  end_time = (18 - data[:timezone]) % 24 # 日をまたぐ場合を考慮
  availability << { start: start_time, end: end_time, employees: data[:employees] }
end

# 全ての時間帯について、その時間に開催される会議に参加できる社員数を計算
max_participants = 0
24.times do |hour|
  participants = 0
  availability.each do |time|
    # 日をまたぐ場合の時間帯の処理
    if time[:start] > time[:end]
      participants += time[:employees] if hour >= time[:start] || hour < time[:end]
    elsif hour >= time[:start] && hour < time[:end]
      participants += time[:employees]
    end
  end
  max_participants = [max_participants, participants].max
end

puts max_participants
