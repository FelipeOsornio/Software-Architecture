# Adapter Pattern
# Date: 13-Apr-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

# Class that model a queue adapter.
class QueueAdapter < SimpleQueue

  # Initializes a new stack, using q as the adaptee.
  def initialize(q)
    @queue = q
  end

  # Inserts x at the top of this stack. Returns this stack.
  def push(x)
    addToTop(x)
    self
  end

  # Returns nil if this stack is empty, otherwise removes and returns its top element.
  def pop
    if empty?
      nil
    else
      @queue.remove
    end
  end

  # Returns nil if this stack is empty, otherwise returns its top element without removing it.
  def peek
    if empty?
      nil
    else
      first = @queue.remove
      addToTop(first)
      first
    end
  end

  # Returns true if this stack is empty, otherwise returns false.
  def empty?
    @queue.empty?
  end

  # Returns the number of elements currently stored in this stack.
  def size
    @queue.size
  end

  private

  # Adds to top the parameter value
  def addToTop(value)
    temp = []
    while not @queue.empty? do
      temp.push(@queue.remove)
    end

    @queue.insert(value)
    temp.each do |item|
      @queue.insert(item)
    end
  end

end