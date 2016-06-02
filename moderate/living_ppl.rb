# Given a list of people with their birth and death years, implement a method to
# compute the year with the most people alive. You may assume that all people were
# born between 1900 2000(inclusive). If a person was alive during any portion of
# that year, they should be included in that year's count. For example, Person
# (birth = 1908, death = 1909) is included in the counts for both 1908 and 1909
def most_alive(people)
  ppl_hash = Hash.new { |hash, key| hash[key] = 0 }
  people.each do |person|
    (person.birth..person.death).each do |year|
      ppl_hash[year] += 1
    end
  end
  most_alive_year = ppl_hash.max_by{|year, count| count }
  most_alive_year.first
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
