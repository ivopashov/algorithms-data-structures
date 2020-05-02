# greates common denominator

# 36, 8 => 4
# 36, 9 => 9
# 13, 17 => 1

def gcd(a, b)
  return b if (a % b == 0)
  return a if (b % a == 0)

  denominator = 1

  (2..[a, b].min).each do |num|
    if (a % num == 0) && (b % num == 0)
      denominator = num
      break
    end
  end

  if denominator == 1
    return 1
  else
    return denominator * gcd((a / denominator), (b / denominator))
  end
end

p gcd 36, 8
p gcd 36, 9
p gcd 13, 17
