def check_balance(node)
  return true if node.nil?
  if (depth(node.less) - depth(node.more)).abs < 2
    check_balance(node.less) && check_balance(node.more)
  else
    return false
  end
end


def depth(node)
  return 0 if node.nil?
  less_value = depth(node.less)
  more_value = depth(node.more)
  [less_value, more_value].max + 1
end
