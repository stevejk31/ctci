# Write methods to implement the multiply, subtract, and divide operations for
# integers. The results of all these are integers. Use only the add operator

def multiply(num1, num2)
  result = 0
  if num1 > num2
    num2.times do
      result += num1
    end
  else
    num1.times do
      result += num2
    end
  end
  result
end

def subtract(num1, num2)
  result = 0
  until num1 == (num2 + result)
    result +=1

  end
  result
end

def divide(num1, num2)
  result = 0
  until num1 == (multiply(num2, result))
    result +=1
  end
  result
end
