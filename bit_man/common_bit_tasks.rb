def get_bit(num, i)
  (num & ( 1 << i )) != 0
end

def set_bit(num, i)
  (num | (1 << i))
end

def clear_bit(num, i)
  mask = ~(1 << i)
  num & mask
end
