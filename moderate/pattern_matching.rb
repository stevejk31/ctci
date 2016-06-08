# You are given two strings, pattern and value. The pattern string consists of
# just the letters of a and b, describing a pattern within a string. For example,
# the string catcatgocatgo matches the pattern aabab(where cat is a and go is b).
# It also matches patterns like a, ab, and b. Write a method ot determine if a
# value matches pattern.

# EXAMPLE:
# input: "catcatgocatgo", "aabab"
# output: true

def pattern_brute_force(pattern, value)
  a_count = count("a", pattern)
  b_count = count("b", pattern)
  a_length = 1
  while (a_count * a_length) < value.length
    b_length = (value.length - (a_count * a_length))/b_count
    a_value = value[0, a_length]
    b_value = b_value_generator(value, pattern, a_value, a_length, b_length)
    if b_value
      return true if pattern_generator(pattern, a_value, b_value) == value
    end
    a_length += 1
  end
  false
end

def b_value_generator(value, pattern, a_value, a_length, b_length)
  value_array = value.split(a_value)
  value_array.each do |string|
    return string if string.length == b_length
  end
  nil
end

def pattern_generator(pattern, a_value, b_value)
  result = ""
  pattern.split("").each do |char|
    result += a_value if char == "a"
    result += b_value if char == "b"
  end
  result
end


def pattern_matching(pattern, value)

end


def count(letter, string)
  count_letter = 0
  string.split("").each do |char|
    count_letter += 1 if char == letter

  end
  count_letter
end
