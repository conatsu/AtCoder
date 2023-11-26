# frozen_string_literal: true

N, M = gets.chomp.split.map(&:to_i)
Alist = gets.chomp.split.map(&:to_i)

voting_count_hash = Hash.new(0)
max_voting_count = 0
min_key_with_max_voting_count = Float::INFINITY

Alist.each do |a|
  voting_count_hash[a] += 1

  if voting_count_hash[a] > max_voting_count
    max_voting_count = voting_count_hash[a]
    min_key_with_max_voting_count = a
  elsif voting_count_hash[a] == max_voting_count && a < min_key_with_max_voting_count
    min_key_with_max_voting_count = a
  end

  puts min_key_with_max_voting_count
end
