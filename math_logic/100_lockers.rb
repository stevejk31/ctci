lockers = Hash.new { |hash, key| hash[key] = false } #false indicates closed locker
(1..100).each do |num|
  locker_num = num
  while locker_num <= 100
    if lockers[locker_num]
      lockers[locker_num] = false
    else
      lockers[locker_num] = true
    end
    locker_num += num
  end
end

lockers.each do |locker_num, state|
  if state
    puts locker_num
  end
end

# they are all perfect squares
