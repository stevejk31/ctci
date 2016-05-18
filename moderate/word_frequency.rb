# Design a method to find the frequency of occurences of any given word in a book.
# What if we were running this algorithm mutiple times

def read_book
  File.readlines('book.txt').map {|line| line.chomp}
end

# non-persistent single look up word frequency
def word_frequency(input_word)
  count = 0
  read_book.each do |line|
    words = line.split(" ")
    words.each do |word|
      word = word.gsub(/\W+/, '')
      word = word.downcase
      count +=1 if word == input_word
    end
  end

  count
end
