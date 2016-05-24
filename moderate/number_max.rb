# Write a method that finds the maximum of two numbers. You should not use if-
# else or any other comparison operator

def num_max(a,b)
  diff = (a-b).abs
  (a + b + diff)/2

end
