# frozen_string_literal: true

N, M = gets.chomp.split(' ').map(&:to_i)
alist = gets.chomp.split(' ').map(&:to_i)
question_scores = {}
(1..M).each do |i|
  question_scores[i] = alist[i - 1]
end

players_answer_statuses = []
N.times do |player_id|
  answer_status = gets.chomp.split('')
  score_status_hash = { 'o' => [], 'x' => [], 'score' => player_id + 1 } # ボーナス点を初期スコアとして加算
  answer_status.each_with_index do |status, i|
    if status == 'o'
      score_status_hash['o'] << i + 1
      score_status_hash['score'] += alist[i] # 問題の点数をスコアに加算
    else
      score_status_hash['x'] << i + 1
    end
  end
  players_answer_statuses << score_status_hash
end

# 各プレイヤーについて必要な問題数を計算する
players_answer_statuses.each_with_index do |current_player, idx|
  # 自分を除いた他のプレイヤーの最大スコアを計算
  max_score_others = (players_answer_statuses[0...idx] + players_answer_statuses[idx + 1..]).map do |player|
    player['score']
  end.max

  # 未解答の問題を点数でソート
  unsolved = current_player['x'].map { |q_id| question_scores[q_id] }.sort.reverse

  # 必要な追加スコアを計算
  required_score = max_score_others - current_player['score'] + 1

  # 必要な問題数を計算
  additional_problems = 0
  unsolved.each do |score|
    break if required_score <= 0

    required_score -= score
    additional_problems += 1
  end

  # 必要な最小の問題数を出力
  puts additional_problems
end
