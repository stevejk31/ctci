# Write a function to swap a number in place (that is, without temporary variables)
def swap(a, b)
  a = a^b
  b = a^b
  a = a^b
  [a,b]
end

def swap2(a,b)
  a = a+b  #a = a+b
  b = a-b  #b = a
  a = a-b
  [a,b]
end
