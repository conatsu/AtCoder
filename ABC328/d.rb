# frozen_string_literal: true

S = gets.chomp
stack = []

S.each_char do |char|
  if stack.size >= 2 && stack[-2..].join == 'AB' && char == 'C'
    # "ABC" を形成する場合、"AB" を削除
    2.times { stack.pop }
  else
    # それ以外の場合はスタックに追加
    stack.push(char)
  end
end

puts stack.join
