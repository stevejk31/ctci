# Design a method to find the frequency of occurences of any given word in a book.
# What if we were running this algorithm mutiple times

def read_book

end

def word_counter
  word_hash = Hash.new { |hash, key| hash[key] = 0 }
  read_book.each do |line|
    words = line.split(" ")
    words.each do |word|
      word = word.gsub(/\W+/, '')
      word = word.downcase
      word_hash[word] += 1
    end
  end
end


def word_frequency(word)
  word_hash[word]
end
