# In an array of intergers, a "peak" is an element which is greater than or equal
# to the adjacent integers and a "calley" is an element which is less than or
# equal to the adjacent integers. For example, in the array [5,8,6,2,3,4,6], [8,6]
# are peaks and [5,2] are valleys. Given an array of integers, sort the array
# into an alternating sequence of peaks and valleys

# EXAMPLE
# Input: [5,3,1,2,3]
# Output: [5,1,3,2,3]

def peaks_valleys(array)
  prev_num = nil
  peak = array[0] > array[1]
  array.each_index do |idx|
  end
end
