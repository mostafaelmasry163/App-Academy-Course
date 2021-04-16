# EXERCISE 1 -- Stack
 class Stack  
    def initialize
      # create ivar to store stack here!
      @input_array= []
    end

    def push(el)
      # adds an element to the stack
      input_array.push(el)
      el
    end

    def pop
      # removes one element from the stack
      input_array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      input_array.last
    end

    private
    attr_reader :input_array
  end

  # EXERCISE 2 -- Queue

  class Queue
  def initialize
    @input_array = []
  end

  def enqueue(el)
    input_array.push(el)
    el
  end

  def dequeue
    input_array.shift
  end

  def peek
    input_array.first
  end

  private

  attr_reader :input_array
  
end

# EXERCISE 3 -- Map

class Map
  def initialize
    @input_array = []
  end

  def set(key, value)
    pair_index = input_array.index { |pair| pair[0] == key }
    if pair_index
      input_array[pair_index][1] = value
    else
      input_array.push([key, value])
    end
    value
  end

  def get(key)
    input_array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    value = get(key)
    input_array.reject! { |pair| pair[0] == key }
    value
  end

  def show
    deep_dup(input_array)
  end

  private

  attr_reader :input_array
  
  def deep_dup(arr)
    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end  
end