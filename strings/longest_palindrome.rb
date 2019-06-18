# find the longest palindrome in a word

def palindrome(word)
  matrix = Array.new(word.size) { Array.new(word.size) { 0 } }
  (0...word.size).each { |i| matrix[i][i] = 1 }

  (word.size - 2).downto(0) do |start|
    finish = start + 1
    while finish < word.size
      if word[start] == word[finish]
        matrix[start][finish] = 2 + matrix[start + 1][finish -1]
      else
        matrix[start][finish] = 0
      end

      finish += 1
    end
  end

  max = 0
  start_index = 0
  end_index = 0

  matrix.each_with_index do |row, i|
    row.each_with_index do |value, j|
      if matrix[i][j] > max
        max = matrix[i][j]
        start_index = i
        end_index = j
      end
    end
  end

  return word[start_index..end_index] if max > 1
end

p palindrome('abzbc') == 'bzb'
p palindrome('abbc') == 'bb'
p palindrome('abcd') == nil
p palindrome('abcddcba') == 'abcddcba'