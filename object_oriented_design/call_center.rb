# Imagine you have a call center with three levels of employees: respondent, manager,
# and director. An incoming telephone call must be first allocated to a respondent who is free. If the
# respondent can't handle the call, he or she must escalate the call to a manager. If the manager is not
# free or not able to handle it, then the call should be escalated to a director. Design the classes and
# data structures for this problem. Implement a method #dispatchCall() which assigns a call to
# the first available employee.

def dispatch_call

end

class CallCenter
  def initialize
    @available = MinHeap.new
    # did not implement a minHeap based on rank
  end

  def available(employee)
    @available.push
  end

  def dispatch_call
    raise "No one is available" if @available.empty?
    @available.pop
  end
end

class Employee
  attr_reader :name, :rank
  attr_accessor :superior
  def initialize(name, superior = nil)
    @superior = superior
    @name = name
    @subordinates = []
  end
end

class Respondent < Employee
  def initialize(name, manager)
    super(name, manager)
    @superior.subordinates.push(self)
    @subordinates = nil
    @rank = 0
  end
end

class Manager < Employee
  def initialize(name, director)
    super(name, director)
    @superior.subordinates.push(self)
    @rank = 1
  end
end

class Director < Employee
  def initialize(name)
    super(name)
    @rank = 2
  end
end
