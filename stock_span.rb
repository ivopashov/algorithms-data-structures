# The stock span problem is a financial problem where we have a series of n daily price quotes for
# a stock and we need to calculate span of stock’s price for all n days.
# The span Si of the stock’s price on a given day i is defined as the maximum number of
# consecutive days just before the given day, for which the price of the stock on the current
# day is less than or equal to its price on the given day.
# For example, if an array of 7 days prices is given as {100, 80, 60, 70, 60, 75, 85},
# then the span values for corresponding 7 days are {1, 1, 1, 2, 1, 4, 6}

# the naive O(n2) solution is obvious here. However, we aim at O(n). The trick is to use a stack as we go
# through the items and push/pop depending on what comes next + some extra counting variables.

def stock_span(prices)
  price_stack = []
  # counting can be done on the basis of indexes but i find this one is more explicit
  counting_stack = []

  prices.each do |price|
    counter = 1

    while !price_stack.last.nil? && price_stack.last <= price do
      price_stack.pop
      counter += counting_stack.pop
    end

    p "price: #{price}, counter: #{counter}"
    price_stack.push price
    counting_stack.push counter
  end
end

p stock_span [100, 80, 60, 70, 60, 75, 85]
