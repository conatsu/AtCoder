def count_same_char_substrings(s)
  count = 0
  max_length_seen = Hash.new(0)
  current_length = 0
  previous_char = nil

  s.each_char do |char|
    if char == previous_char
      current_length += 1
    else
      previous_char = char
      current_length = 1
    end

    if current_length > max_length_seen[char]
      count += 1
      max_length_seen[char] = current_length
    end
  end

  count
end

N = gets.chomp.to_i
S = gets.chomp

puts count_same_char_substrings(S)
