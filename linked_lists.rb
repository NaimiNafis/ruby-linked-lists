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
    # Check if the list is empty or contains only one node
    if @head.nil? || @head.next_node.nil?
      @head = nil
      return
    else
      current = @head
      # Traverse the list until reaching the 2nd last node
      until current.next_node.next_node.nil?
        current = current.next_node
      end
      current.next_node = nil
    end
  end

  def contains?(value)
    return false if @head.nil?

    current = @head
    while current != nil
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?
    index = 0
    current = @head
    while current != nil
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    string = ''
    while current != nil
      string << " (#{current.value}) ->"
      current = current.next_node
    end
    string << " nil "
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
