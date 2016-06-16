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
# hash_solution
def t9_hash(numbers)
  possibility = NUM_MAP[numbers[0].to_i]
  (1...numbers.length).each do |idx|
    current = NUM_MAP[numbers[idx].to_i]

    p current
  end
  possibility
end

# tri solution
def t9_tri(numbers)



end
