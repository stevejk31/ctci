# In the new post-apocalyptic world, the world queen is desperately concerned
# about the birth rate. Therefore, she decrees that all families should ensure that they have one girl or
# else they face massive fines. If all families abide by this policy-that is, they have continue to have
# children until they ahve one girl, at which point they immediately stop-what will the gener ratio
# of the new generation be? (Assume that the odds of someone having a boy or a girl on any given
# pregnancy is equal.) Solve this out logically and then write a computer simulation of it.

def give_birth
  ["boy", "girl"].sample
end
next_generation = []
100.times do
  next_generation.push(give_birth)
end
puts next_generation.count("boy")
puts next_generation.length
