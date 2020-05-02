# convert infix to postfix

# a+b*(c^d-e)^(f+g*h)-i
# => abcd^e-fgh*+^*+i-


def infix_to_postfix(expression)
  precedence = {'+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3}

  operators = []
  operands_chars = ('a'..'z').to_a

  expression.chars.each do |ch|
    if operands_chars.include? ch
      print ch
      next
    end


    if ch == '('
      operators.push ch
    elsif ch == ')'
      loop do
        last = operators.pop

        if last == '('
          break
        end

        print last
      end
    elsif operators.empty? || operators.last == '(' || precedence[ch] >= precedence[operators.last]
      operators.push ch
    elsif precedence[ch] < precedence[operators.last]
      while !operators.empty? && operators.last != '(' && precedence[ch] < precedence[operators.last]
        print operators.pop
      end
      operators.push ch
    end
  end

  while !operators.empty?
    print operators.pop
  end
end

infix_to_postfix 'a+b*(c^d-e)^(f+g*h)-i'
