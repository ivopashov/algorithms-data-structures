# add two numbers without using arithmetic operations

def bitwise_add (x, y)
    # summation of two bits can be represented with XOR
    # carry is represented by AND
    return x if y == 0
    bitwise_add (x ^ y), ((x & y) << 1)
  end

  puts bitwise_add(3, 9) == 12