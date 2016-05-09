# Write a method to comput all permutatiosn of a string whose charac-
# ters are not necessarily unique. The list of permutations should not have duplicates.


def get_perms(input_string, cache={})
  return [""] if input_string.length == 0
  if input_string.length == 1
    return [input_string]
    cache[input_string] = [input_string]
  end
  perms = []
  input_string.split("").each_with_index do |char, idx|
    temp_string = input_string[0...idx] + input_string[(idx+1)..-1]
    unless cache[temp_string]
      temp_perms = get_perms(temp_string, cache)
      perms += temp_perms.map do |perm|
        char+perm
      end
      cache[input_string] = perms.uniq!
    end
  end
  perms
end
