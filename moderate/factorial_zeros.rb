# Write an algorithm which computes the number of trailing zeros in n factorial.

def factorial(n)
  return [] if n == 0
  return [1] if n == 1
  return [1,2] if n == 2
  prev_factorial = factorial(n-1)
  prev_factorial.push(prev_factorial.last*n)
end

def bf_trailing_zero(n)
  count = 0
  num = factorial(n).last.to_s.split("")
  temp = num.pop
  until temp != "0"
    count +=1 if temp == "0"
    temp = num.pop
  end
  count
end

def trailing_zero_factorial(n)


end
