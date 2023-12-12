N, K = gets.chomp.split.map(&:to_i)
meds = Array.new(N) { gets.chomp.split.map(&:to_i) }
meds.sort_by! { |med| med.first }

sum = 0
meds.each do |med|
  sum += med.last
end

if sum <= K
  puts 1
else
  (0...meds.size).each do |i|
    if sum <= K
      puts meds[i - 1].first + 1
      exit
    end
    sum -= meds[i].last
  end
  puts meds.last.first + 1
end
