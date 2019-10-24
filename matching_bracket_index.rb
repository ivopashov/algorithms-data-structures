# "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."

# Write a function that, given a sentence like the one above,
# along with the position of an opening parenthesis, finds the corresponding closing parenthesis.

# Example: if the example string above is input with the number 10 (position of the first parenthesis),
# the output should be 79 (position of the last parenthesis).

def find_index_of_closing_bracket(input, index_of_opening_bracket)
  dict = {}
  stack = []

  input.
    chars.
    each_with_index do |ch, index|
      stack.push(index) if ch == '('
      dict[stack.pop] = index if ch == ')'
    end

  dict[index_of_opening_bracket]
end

p find_index_of_closing_bracket "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.", 10
# => 79
