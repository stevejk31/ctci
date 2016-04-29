# Implement a function to check if a binary tree is a binary search tree

# issues with repeated values
def validate_bst(node)
  return true if node.less.nil? && node.more.nil?
  if node.less.nil? && node.more.value < node.value
    validate_bst(node.more)
  elsif node.more.nil? && node.less.value < node.value
    validate_bst(node.less)
  elsif node.less.value < node.value && node.more.value < node.value
    validate_bst(node.less)
    validate_bst(node.more)
  end
  false

end

# can implement using a print function and checking route
