# Given an infinite number of quarters (25 cents), dimes(10 cents), nickels (5 cents), and
# pennies (1 cent), write code to calculate the number of ways of representing n cents.

# Example
#input any value less than 6 cents

def coins(cents, coins = [25,10,5,1])
  return 1 if coins.length == 1
  count = 0
  current_coin = coins.shift
  until cents < current_coin
    count += coins(cents, coins)
    cents -= current_coin
  end
  count += coins(cents, coins)
  count
end
