# Given a list of people with their birth and death years, implement a method to
# compute the year with the most people alive. You may assume that all people were
# born between 1900 2000(inclusive). If a person was alive during any portion of
# that year, they should be included in that year's count. For example, Person
# (birth = 1908, death = 1909) is included in the counts for both 1908 and 1909
def most_alive(people)

end

class Person
  attr_reader :birth, :death
  def initialize(birth, death)
    @birth = birth
    @death = death
  end
end
