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

def fizz_buzz(num)
  if (num % 15).zero?
    'FizzBuzz'
  elsif (num % 3).zero?
    'Fizz'
  elsif (num % 5).zero?
    'Buzz'
  else
    num.to_s
  end
end

require 'minitest/autorun'

# FizzBuzzTest
class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal '1', fizz_buzz(1)
    assert_equal '2', fizz_buzz(2)
    assert_equal 'Fizz', fizz_buzz(3)
    assert_equal '4', fizz_buzz(4)
    assert_equal 'Buzz', fizz_buzz(5)
    assert_equal 'Fizz', fizz_buzz(6)
    assert_equal 'FizzBuzz', fizz_buzz(15)
  end
end

# puts fizz_buzz(1)

something = 'Bye'
puts %(He said, "#{something}"!)

# ヒアドキュメメント
a = <<~TEXT
  これはヒアドキュメントです。
  複数行に渡る長い文字列を作成するのに便利です。
TEXT

puts a

# sprintfメソッド → formatメソッドを使う方が良い
puts format('%0.3f', 1.2)
# puts '%.3f' % 1.2 # こちらでも同じ結果が得られる

# 範囲オブジェクト
# [*1..5] #=> [1, 2, 3, 4, 5]
# [*1...5] #=> [1, 2, 3, 4]

('a'..'e').to_a #=> ["a", "b", "c", "d", "e"]

dimensions = [
  [10, 20],
  [30, 40],
  [50, 60]
]

areas = []
dimensions.each do |length, width|
  areas << length * width
end
p areas #=> [200, 1200, 3000]

dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# 番号指定パラメータ
p %w[japan us india].map.with_index(1) { |country, i| "#{i}: #{country}" }
#=> ["1: japan", "2: us", "3: india"]
p %w[japan us india].map.with_index(1) { [_2, _1] }
#=> [["japan", 0], ["us", 1], ["india", 2]]

# throwとcatch
fruits = %w[apple melon orange]
numbers = [1, 2, 3]
catch :done do
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      throw :done if fruit == 'orange' && n == 3
    end
  end
end

def find_currency(country)
  currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  currencies[country]
end

def show_currency(country)
  currency = find_currency(country)
  # currencyがnilの場合のみ例外を発生させたい
  # if currency
  #   currency.upcase
  # end
  # if文の代わりに&.演算子を使う
  currency&.upcase
end

def user_exits?
  !!find_user # !!を使ってメソッドの戻り値を真偽値に変換する
end
