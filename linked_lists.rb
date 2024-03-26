require 'pry-byebug'

class LinkedList
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current = @head
      binding.pry
      current = current.next_node until current.next_node.nil?
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    count = 0
    current = @head
    until current.nil?
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    current = @head
    return nil if current.nil?

    until current.next_node.nil?
      current = current.next_node
    end
    current
  end

  def at(index)
    count = 0
    current = @head
    while count != index && !current.nil?
      current = current.next_node
      count += 1
    end
    current
  end

  def pop
    if @head.nil? || @head.next_node.nil?
      @head = nil
      return
    else
      current = @head
      until current.next_node.next_node.nil?
        current = current.next_node
      end
      current.next_node = nil
    end
  end

  def contains?(value)

  end

  def find(value)

  end

  def to_s

  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
