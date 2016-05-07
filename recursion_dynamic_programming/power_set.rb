# Write a method to return all subsets of a set

def power_set(array, idx = array.length)
  subsets = [[]]
  return subsets if array.length == 0
  subsets.push(array[0]) if idx == 0
  subsets = power_set(array, idx - 1)
  subsets += subsets.dup.map { |array| array.push(array[idx])}
end
