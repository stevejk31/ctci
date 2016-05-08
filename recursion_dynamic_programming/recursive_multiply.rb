def recursive_multiply(num1, num2)
  return 0 if num2 == 0
  if num1 > num2
    num1 + recursive_multiply(num1, num2-1)
  else
    num2 + recursive_multiply(num2, num1-1)
  end
end

def better_multiply(num1, num2)
  if num1 > num2
    bigger, smaller = num1, num2
  else
    bigger, smaller = num2, num1
  end

  multiply_helper(smaller, bigger)
end

def multiply_helper(smaller, bigger)
  return 0 if smaller == 0
  return bigger if smaller == 1
  s = smaller >> 1
  half_prod = multiply_helper(s, bigger)
  if smaller % 2 == 0
    half_prod + half_prod
  else
    half_prod + half_prod + bigger;
  end
end
