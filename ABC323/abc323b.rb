# frozen_string_literal: true

N = gets.chomp.to_i
match_result_hash = {}
player_id = 1
N.times do
  match_result = gets.chomp.split('')
  count = Hash.new(0)
  match_result.each do |result|
    count[result] += 1
  end
  match_result_hash[player_id] = count['o']
  player_id += 1
end

ranking = match_result_hash.sort_by { |k, v| [-v, k.to_i] }.map { |k, _v| k }
puts ranking.join(' ')
