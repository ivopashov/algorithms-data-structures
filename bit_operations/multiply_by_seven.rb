# efficient way to multiply by 7
# left shift by 3 which is basically * 8 and substract the initial number

def multiply_by_7(number)
    (number << 3) - number
  end

  puts multiply_by_7(21) === 147