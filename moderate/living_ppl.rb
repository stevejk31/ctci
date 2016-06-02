# Given a list of people with their birth and death years, implement a method to
# compute the year with the most people alive. You may assume that all people were
# born between 1900 2000(inclusive). If a person was alive during any portion of
# that year, they should be included in that year's count. For example, Person
# (birth = 1908, death = 1909) is included in the counts for both 1908 and 1909
def most_alive_brute_force(people)
  ppl_hash = Hash.new { |hash, key| hash[key] = 0 }
  # O(n * m); n = ppl and m = years
  people.each do |person|
    (person.birth..person.death).each do |year|
      ppl_hash[year] += 1
    end
  end
  most_alive_year = ppl_hash.max_by{|year, count| count }
  p ppl_hash.sort_by {|k,v| k}
  most_alive_year.first
end

def most_alive(people)
  births = []
  deaths = []
  people.each do |person|
    births.push(person.birth)
    deaths.push(person.death)
  end
  births.sort!
  deaths.sort!
  birth_idx = 0
  death_idx = 0
  alive = 0
  max_alive = 0
  max_year = 0
  while birth_idx < births.length
    if births[birth_idx] < deaths[death_idx]
      alive += 1
      birth_idx += 1
    elsif deaths[death_idx] > births[birth_idx]
      alive -= 1
      death_idx += 1
    else
      birth_idx += 1
      death_idx += 1
    end
    if alive > max_alive
      max_year = births[birth_idx]
      max_alive = alive
    end
  end

  max_year
end

class Person
  attr_reader :birth, :death
  def initialize(birth, death)
    @birth = birth
    @death = death
  end
end

ppl = []
500.times do
  birth = 1900 + rand(100)
  death = 1901 + rand(99)
  if birth < death
    ppl.push(Person.new(birth, death))
  end
end
puts most_alive_brute_force(ppl)
puts most_alive(ppl)
