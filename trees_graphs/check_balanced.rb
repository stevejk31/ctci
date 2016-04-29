def check_balance(node)
  (depth(node.less) - depth(node.more)).abs < 2
end


def depth(node)
  return 0 if node.nil?
  less_value = depth(node.less)
  more_value = depth(node.more)
  [less_value, more_value].max + 1
end
