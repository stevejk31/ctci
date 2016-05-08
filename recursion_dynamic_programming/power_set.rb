# Write a method to return all subsets of a set

def power_set(array)
  return [[]] if array.length == 0
  num = array.pop
  subsets = power_set(array)
  new_set = deep_dup(subsets).map{ |el| el.push(num)}
  subsets.concat(new_set)
end


def deep_dup (array)
  array.map do |el|
    if el.is_a?(Array)
      deep_dup(el)
    else
      el
    end
  end
end

def power_set_binary(array)
  number_el = 2**array.length
  subsets = []
  number_el.times do |num|
    subsets.push(convert_binary_subset(array, num.to_s(2)))
  end
  subsets
end

def convert_binary_subset(array, binary_num)
  set = []
  binary_num.split("").each_with_index do |num, idx|
    bin_num = num.to_i
    if bin_num == 1
      number = array[array.length - binary_num.length + idx]
      set.push(number) if number
    end
  end
  set
end
