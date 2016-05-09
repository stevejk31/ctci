# Implement an algorithm to print all valid (e.g., properly opened and closed) combinations
# of n pairs of parentheses

# EXAMPLE
# Input: 3
<<<<<<< HEAD
# Output: ((())), (()()), (())(), ()()(), ()()

# EXAMPLE
# Input: 2
# Output: (()), ()()

def parens(num_parens)
  return ["()"] if num_parens == 1
  result = []
  parens(num_parens - 1).each do |paren|
    paren.insert(0,"(")
    (paren.length-1).times do |num|
      temp = paren.dup
      temp.insert(num+1, ")")
      result.push(temp) unless result.include?(temp)
    end
  end
  result
end
=======
# Output: ((())), (()()), (())(), ()()()
>>>>>>> parent of fc23735... parens solved
