def is_present(word, text)
  return nil if word.nil? || text.nil?
  return false if word.size > text.size
  return true if word.size == 0 && text.size > 0

  word_and_text = word + '$' + text
  z_array = Array.new(word_and_text.size) { 0 }

  ((word.size + 1)...word_and_text.size).each do |i|
    if word_and_text[i] == word_and_text[z_array[i - 1]]
      z_array[i] = z_array[i - 1] + 1
    elsif word_and_text[i] == word_and_text[0]
      z_array[i] = 1
    end
  end

  z_array.any? { |num| num == word.size }
end

p is_present('aab', 'baabaa')
p is_present('aab', 'baacaa')
