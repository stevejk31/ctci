# On old cell phones, a users typed on a numeric keypad and the phone would
# provide a list of words that matched these numbers. Each digit mapped to a set
# of 0-4 letters. Implement an algorithm to return a list of matching words,
# given a sequence of digits. You are provided a list of valid words (provided in
# whatever data structure you'd like). The mapping is shown in the diagram below.

# 1 -
# 2 - [a,b,c]
# 3 - [d,e,f]
# 4 - [g,h,i]
# 5 - [j,k,l]
# 6 - [m,n,o]
# 7 - [p,q,r,s]
# 8 - [t,u,v]
# 9 - [w,x,y,z]
# 0 -

# EXAMPLE:
# Input: 8733
# Output: tree, used
NUM_MAP = {
  2 => ["a","b","c"],
  3 => ["d","e","f"],
  4 => ["g","h","i"],
  5 => ["j","k","l"],
  6 => ["m","n","o"],
  7 => ["p","q","r","s"],
  8 => ["t","u","v"],
  9 => ["w","x","y","z"]
}
DICTIONARY_HASH = {
  "tree" => true,
  "used" => true,
}
# hash_solution
def t9_hash(numbers)
  possibility = NUM_MAP[numbers[0].to_i]
  (1...numbers.length).each do |idx|
    temp = []
    current = NUM_MAP[numbers[idx].to_i]
    possibility.map do |word|
      temp_word = word
      current.each do |letter|
        temp.push(word + letter)
      end
      possibility = temp
    end
  end
  result = []
  possibility.each do |word|
    if DICTIONARY_HASH[word]
      result.push(word)
    end
    result
  end
  result
end

DICTIONARY_TRI = {}
# tri solution
def t9_tri(numbers)



end
