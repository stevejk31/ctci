# Write a method to compute all permutations of a string of unique characters


# naive solution and it requires dup
def get_perms(input_string)
  return [""] if input_string.length == 0
  return [input_string] if input_string.length == 1
  input_array = input_string.split("")
  letter = input_array.pop
  words = get_perms(input_array.join(""))
  perms = []
  words.each do |word|
    (word.length+1).times do |idx|
      perms.push(word.dup.insert(idx,letter))
    end
  end
  perms
end

def get_perm_two(two_string)
  string_one = two_string[1]+two_string[0]
  string_two = two_string[0]+two_string[1]
  [string_one, string_two]
end

def get_perms_better(input_string)
  return [""] if input_string.length == 0
  return [input_string] if input_string.length == 1
  return get_perm_two(input_string) if input_string.length == 2
  perms = []
  input_string.split("").each do |char|
    temp_string = input_string.delete(char)
    temp_perms = get_perms_better(temp_string)
    perms+= temp_perms.map do |perm|
      char+perm
    end
  end
  perms
end
