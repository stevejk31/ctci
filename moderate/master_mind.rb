# The Game of Master Mind is played as follows:
# The computer has four slots, and each slot will contain a ball that is red (R),
# yellow(Y), green(G) or blue (B). For exmaple, the computer might have RGGB.
#
# You, the user, are trying to guess the solution. You might, for example, guess
# YRGB.
# When you guess the correct color for the correct slot, you get a "hit." if you
# guess a color that exists but is in the wrong slot, you get a "pseudo-hit."
# Note that a slot that is a hit can never count as a pseudo-hit.
#
# For example, if the actual solution is RGBY and you guess GGRR, you have one hit
# and one pseudo-hit. Write a method that, given a guess and a solution, returns
# the number of hits and pseudo-hits.


def master_mind(solution, guess)
  hits = hit(solution, guess)
  pseudo_hits = psuedo_hit(solution, guess)
  "hits: #{hits}\n pseudo hits: #{pseudo_hits}"
end


def hit(solution, guess)
  result = []
  solution.length.times do |idx|
    if solution[idx] == guess[idx]
      result.push(idx)
    end
  end
  result

end

def psuedo_hit(solution, guess)
  sol_hash = Hash.new { |hash, key| hash[key] = Array.new }
  result = []
  solution.each_with_index do |val, idx|
    sol_hash[val].push(idx)
  end
  guess.each_with_index do |val, idx|
    if !sol_hash[val].empty? && !sol_hash[val].include?(idx)
      result.push(idx)
    end
  end
  result
end
