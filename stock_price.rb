# https://www.interviewcake.com/question/python/stock-price
# The idea is to find the best moment to buy and sell a stock presented with time series of stock price data

def find_best_buy_sell(prices)
  return [] if prices.empty? || prices.size == 1
  minimum = prices.first
  profit = 0
  pair = []

  prices[1...].each do |price|
    if (price - minimum) > profit
      pair = [minimum, price]
    end

    minimum = price if price < minimum
  end

  pair
end

p find_best_buy_sell([]) == []
p find_best_buy_sell([1]) == []

p find_best_buy_sell([95, 102, 101, 105, 100, 104, 90, 103]) == [90, 103]
p find_best_buy_sell([100, 99, 98]) == []
p find_best_buy_sell([95, 102, 101, 105]) == [95, 105]