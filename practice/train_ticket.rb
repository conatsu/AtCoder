# frozen_string_literal: true

operations = ['+', '-']
A, B, C, D = gets.chomp.split('').map(&:to_i)

operations.each do |op1|
  operations.each do |op2|
    operations.each do |op3|
      result = A.send(op1, B).send(op2, C).send(op3, D)
      if result == 7
        puts "#{A}#{op1}#{B}#{op2}#{C}#{op3}#{D}=7"
        exit
      end
    end
  end
end
