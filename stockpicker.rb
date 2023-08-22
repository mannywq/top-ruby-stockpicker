days = [17, 3, 6, 9, 15, 8, 6, 1, 10]

def stock_picker(range)
  min_p = range[0]
  min_i = 0

  profit = 0

  days = [0, 0]

  range.each_with_index do |price, index|
    # if current price is cheaper than current buy pos we update
    if price < min_p
      min_p = price
      min_i = index
      next # keep the loop going as we don't want to buy and sell the same day
    end

    # if current price - buy price > profit margin, update and set sell date
    if price - min_p > profit
      profit = price - min_p
      days = [min_i, index]
    end
  end

  puts "Buy on #{days[0]} and sell on #{days[1]} for $#{profit} profit"
end

stock_picker(days)
