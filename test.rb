# frozen_string_literal: true

DX = [0, 1, 0, -1, 1, 1, -1, -1].freeze
DY = [1, 0, -1, 0, 1, -1, 1, -1].freeze

def factorial(n)
  (1..n).inject(1) { |product, i| product * i }
end

puts factorial(13)

target = 100_000
puts(target**(1.0 / 3))

cc = { 'nz' => 'New Zealand', 'ru' => 'Russia', 'ar' => 'Argentina' }
# p cc.contain?("nz")
p cc.member?('nz')

s = 'To be or not to be, that is the question.'
hash = Hash.new(0)
s.scan(/\w+/) { |i| hash[i] += 1 }
p hash['be'] #=>2

p(/[0-9]{3}-[0-9]{4}/)

p Dir.getwd
