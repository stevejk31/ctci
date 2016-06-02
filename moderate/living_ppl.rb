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
  most_alive_year.first
end

def most_alive(people)
  people.each do |person|
    births.push(person.birth)
    deaths.push(person.death)
  end
  births.sort!
  deaths.sort!
  births_hash = Hash.new { |hash, key| hash[key] = 0 }
  alive = 0
  births.each do |year|
    alive += 1
    births_hash[year] = alive
  end
  deaths_hash = Hash.new { |hash, key| hash[key] = 0 }
  death.each do |year|
    death += 1
    deaths_hash[year] = death
  end
  (1900..2000).each do |year|

  end
end

class Person
  attr_reader :birth, :death
  def initialize(birth, death)
    @birth = birth
    @death = death
  end
end

ppl = []
20.times do
  birth = 1900 + rand(100)
  death = 1901 + rand(99)
  if birth < death
    ppl.push(Person.new(birth, death))
  end
end


puts most_alive(ppl)
