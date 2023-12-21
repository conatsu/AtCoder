# frozen_string_literal: true

# String class extension for upcase? and downcase?
class String
  def upcase?
    self == upcase
  end

  def downcase?
    self == downcase
  end
end

S = gets.chomp

words = []
i = 0
while i < S.length
  j = i + 1
  j += 1 while j < S.length && S[j].downcase?
  words << S[i..j]
  i = j + 1
end

puts words.sort_by { |word| [word.downcase, word.upcase?] }.join
