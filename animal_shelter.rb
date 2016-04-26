# An animal shelter, which holds only dogs and cats, operates on a strictly "first in, first
# out" basis. People must adopt either the "oldest"(based on arrival time) of all animals at the shelter,
# or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of
# that type). They cannot select which specific animal they would like. Create the data structures to
# maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog,
# and dequeueCat. You may use the built-in LinkedList data structure.

require 'Time'

class AnimalShelter
  attr_reader :dog_queue, :cat_queue
  def initialize
    @dog_queue = []
    @cat_queue = []
  end
  #push and shift

  def enqueue(animal)
    raise "Not a valid animal" unless animal.class == Animal
    if animal.animal_type == "Cat"
      @cat_queue.push([animal, Time.now])
    else
      @dog_queue.push([animal,Time.now])
    end
  end

  def dequeue_cat
    raise "No more cats" if @cat_queue.empty?
    @cat_queue.shift
  end

  def dequeue_dog
    raise "No more dogs" if @dog_queue.empty?
    @dog_queue.shift
  end

  def dequeue_any
  end

end

class Animal
  attr_reader :name, :animal_type
  def initialize(name, animal_type)
    raise "name needed" if name == nil
    raise "not valid animal_type" unless animal_type == "Dog" || animal_type == "Cat"
    @name = name
    @animal_type = animal_type
  end

end
as = AnimalShelter.new
["Andy","Steve","Sarah","Sara","Andrew","Brian","Tim","Frank"].each do |name|
  as.enqueue(Animal.new(name,["Cat","Dog"].sample))
end
p as.cat_queue
p as.dog_queue
