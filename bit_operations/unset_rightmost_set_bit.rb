# unset the right most set bit

def unset_right(number)
    number & (number - 1)
end

puts unset_right(3) === 2