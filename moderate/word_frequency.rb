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


class WordCounter
  def initialize(book_filename)
    @word_count = Hash.new { |hash, key| hash[key] = 0 }
    File.readlines(book_filename).each do |line|
      words = parse_line(line)
      words.each do |word|
        @word_count[word] += 1
      end
    end

    def word_frequency(input_word)
      @word_count[input_word]
    end


    private

    def parse_line(line)
      line.strip.split(" ").map do |word|
        word = word.gsub(/\W+/, '')
        word.downcase
      end
    end
  end
