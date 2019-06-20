# we have encoded characters as
# '1' => a
# '2' => b
# etc.
# given a string, find all character combinations that form it

# Input: 1132
# Output:
# aacb (1 1 3 2)
# kcb (11 3 2)
# amb (1 13 2)
# (11 32) and (1 1 32) are a no go as we don't have a mapping for 32

# MAPPING = {
#   '1' => 'a',
#   '2' => 'b',
#   '3' => 'c',
#   '4' => 'd',
#   '5' => 'e',
#   '6' => 'f',
#   '7' => 'g',
#   '8' => 'h',
#   '9' => 'i',
#   '10' => 'j',
#   '11' => 'k',
#   '12' => 'l',
#   '13' => 'm',
#   '14' => 'n',
#   '15' => 'o',
#   '16' => 'p',
#   '17' => 'q',
#   '18' => 'r',
#   '19' => 's',
#   '20' => 't',
#   '21' => 'u',
#   '22' => 'v',
#   '23' => 'w',
#   '24' => 'x',
#   '25' => 'y',
#   '26' => 'z',
# }

def num_ways(input)
  return helper input
end

# this has many overlapping subproblems and can be optimized with memoization
# main idea is that helper('1132') = helper('132') + helper('32')

def helper(str)
  return 1 if str.size == 0

  result = helper str[1..]
  result += helper(str[2..]) if str.size >= 2 && str[0...2].to_i <= 26

  result
end

p num_ways('1132') == 3
p num_ways('1126') == 5