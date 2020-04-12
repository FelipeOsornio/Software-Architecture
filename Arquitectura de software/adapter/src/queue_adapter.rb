# Adapter Pattern
# Date: 13-Apr-2020
# Authors:
#          A01377154 Felipe Osornio
#          A01378838 Eric Gómez

class QueueAdapter < SimpleQueue

  def initialize(q)
    @queue = q
  end

  def push(x)
    addToTop(x)
    self
  end

  def pop
    if empty?
      nil
    else
      @queue.remove
    end
  end

  def peek
    if empty?
      nil
    else
      first = @queue.remove
      addToTop(first)
      first
    end
  end

  def empty?
    @queue.empty?
  end

  def size
    @queue.size
  end

  private

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