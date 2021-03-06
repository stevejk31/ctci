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

def negative(num)
  if num > 0
    "-#{num}".to_f
  elsif num < 0
    "#{num}"[1..-1].to_f
  end

end

def subtract(num1, num2)
  num1 + negative(num2)
end

def divide(num1, num2)
  result = 0
  until num1 < num2
    num1 = subtract(num1, num2)
    result +=1
  end
  [result, num1]
end
