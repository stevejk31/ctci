# Write a program to sort a stack such taht the smallest items are on the top. You can use
# An additional temporary stack, but you may not copy the elements into any other data structure
# (such as an array). The stack supports the following operations: push, pop, peek, and isEmpty.
def sort_stack! (stack, input_length = 0)
  return stack if stack.length == input_length
  temp_stack = []
  temp_max = nil
  until stack.length == input_length
    temp = stack.pop
    if temp_max == nil
      temp_max = temp
    elsif temp > temp_max
      temp, temp_max = temp_max, temp
      temp_stack.push(temp)
    else
      temp_stack.push(temp)
    end
  end
  stack.push(temp_max)
  until temp_stack.empty?
    stack.push(temp_stack.pop)
  end
  sort_stack!(stack, input_length + 1)
end
