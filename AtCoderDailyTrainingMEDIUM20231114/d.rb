class Product
  attr_accessor :price, :function_list, :name

  def initialize(price, function_list, name)
    @price = price
    @function_list = function_list
    @name = name
  end
end

N, M = gets.chomp.split.map(&:to_i)
productList = []
N.times do |i|
  input = gets.chomp.split
  price = input[0].to_i
  function_num = input[1].to_i
  function_list = []
  function_num.times do |j|
    function_list << input[2 + j].to_i
  end
  productList << Product.new(price, function_list, i)
end

flag = false
productList.each do |product|
  productList.each do |product2|
    next unless product.price <= product2.price
    next unless product.name != product2.name && (product2.function_list.all? do |item|
                                                    product.function_list.include?(item)
                                                  end)
    next unless product.price < product2.price || product.function_list.size > product2.function_list.size

    flag = true
    break
  end
end

puts flag ? 'Yes' : 'No'
