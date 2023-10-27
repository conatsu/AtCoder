# frozen_string_literal: true

D = gets.chomp.to_i
N = gets.chomp.to_i

# Step 1: Create a diff array
diff = Array.new(D + 2, 0) # +2 for boundary conditions
N.times do
  l, r = gets.chomp.split(' ').map(&:to_i)
  diff[l] += 1
  diff[r + 1] -= 1
end

# Step 2: Create the cumulative array from the diff array
cumulative = [0]
(1..D).each do |i|
  cumulative[i] = cumulative[i - 1] + diff[i]
end

# Step 3: Output the results
cumulative[1..D].each do |val|
  puts val
end
