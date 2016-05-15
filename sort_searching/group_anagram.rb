# Write a method to sort an array of strings so that all the anagrams are next to
# each other

def group_anagram(strings)
  hash_strings = Hash.new { |hash, key| hash[key] = Array.new }
  sorted_strings = []
  # O(n)
  strings.each do |string|
    hash_strings[hashify_word(string)].push(string)
  end
  # O(anagrams)
  hash_strings.each do |anagrams, words|
    sorted_strings += words
  end
  sorted_strings
end


def hashify_word(word)
  hash_word = Hash.new { |hash, key| hash[key] = 0 }
  word.each_char do |letter|
    hash_word[letter] +=1
  end
  hash_word
end
