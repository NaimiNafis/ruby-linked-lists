class LinkedList

  def initialize

  end

  def append(value)

  end

  def prepend(value)

  end

  def size

  end

  def head

  end

  def tail

  end

  def at(index)

  end

  def pop

  end

  def contains?(value)

  end

  def find(value)

  end

  def to_s

  end
end

class Node
  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end
end
