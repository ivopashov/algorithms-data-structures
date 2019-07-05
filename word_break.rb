# Given an input string and a dictionary of words, find out if the input string can be segmented into a space-separated sequence of dictionary words. See following examples for more details.
# This is a famous Google interview question, also being asked by many other companies now a days.

# Consider the following dictionary
# { i, like, sam, sung, samsung, mobile, ice,
#   cream, icecream, man, go, mango}

# Input:  ilike
# Output: Yes
# The string can be segmented as "i like".

# Input:  ilikesamsung
# Output: Yes
# The string can be segmented as "i like samsung"
# or "i like sam sung".

require 'set'
WORDS = Set.new ['i', 'like', 'sam', 'sung', 'samsung', 'mobile', 'ice', 'cream', 'icecream', 'man', 'go', 'mango']

# =====================================================================
def check_word(word)
  break? word
end

def break?(word)
  return true if word.size == 0

  (1..word.size).each do |index|
    prefix = word[0...index]
    suffix = word[index...]
    return true if (WORDS.include?(prefix) && break?(suffix))
  end

  false
end

p check_word('ilike') == true
p check_word('ilikeno') == false

# =====================================================================

def word_break_backtrack(word)
  word_break word, [], []
end

def word_break(word, tmp_result, final_result)
  (1..word.size).each do |index|
    prefix = word[0...index]
    suffix = word[index...]
    if WORDS.include?(prefix)
      if index == word.size
        final_result << (tmp_result + [prefix])
        return final_result
      end
      word_break suffix, tmp_result + [prefix], final_result
    end
  end
end

p word_break_backtrack('samsung')