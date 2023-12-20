# frozen_string_literal: true

operations = ['+', '-']
A, B, C, D = gets.chomp.split('').map(&:to_i)

operations.each do |op1|
  operations.each do |op2|
    operations.each do |op3|
      ans = "#{A}#{op1}#{B}#{op2}#{C}#{op3}#{D}"
      if eval(ans) == 7
        puts "#{ans}=7"
        exit
      end
    end
  end
end
