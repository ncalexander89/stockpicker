def stock_picker(stock_array)
  #empty profit/picker array
  profit_array=[]
  picker_array=[]
  #cycle through each price and day
  stock_array.each_with_index do |buy_price, day|
    #if remaining days after purchase is zero return same sell price
    if (day+1)==stock_array.length
      sell_array=stock_array[day,stock_array.length]
    else
      #new array with remaining prices to sell
      sell_array=stock_array[day+1,stock_array.length]
    end
  #maximum sell price from remaining days
  sell_price = sell_array.max()
  #push maximum sell price from remaining days at each buy price to profit array
  profit_array.push(sell_array.max()-buy_price)
  #push picker combination to picker array  
  picker_array.push([stock_array.index(buy_price),stock_array.index(sell_price)])
  end
  #match index with highest profit to picker combination
  picker_array[profit_array.index(profit_array.max())]
end
p stock_picker([17,3,6,9,15,8,6,1,10])
