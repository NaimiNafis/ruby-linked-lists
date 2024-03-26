# frozen_string_literal: true

require 'pry-byebug'

# LinkedList implementation in Ruby
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

  def tail
    current = @head
    return nil if current.nil?

    current = current.next_node until current.next_node.nil?
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
    return if @head.nil? || @head.next_node.nil?

    current = @head
    # Traverse the list until reaching the 2nd last node
    current = current.next_node until current.next_node.next_node.nil?
    current.next_node = nil
  end

  def contains?(value)
    return false if @head.nil?

    current = @head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    return nil if @head.nil?

    index = 0
    current = @head
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    current = @head
    string = String.new
    until current.nil?
      string << " (#{current.value}) ->"
      current = current.next_node
    end
    string << ' nil '
  end

  # Extra Credit:

  def insert_at(value, index)
    new_node = Node.new(value)

    if index.zero?
      new_node.next_node = @head
      @head = new_node
      return
    end

    current = @head
    previous = nil
    current_index = 0

    # Traverse the list to find the position just before the insertion point
    while !current.nil? && current_index < index
      previous = current
      current = current.next_node
      current_index += 1
    end

    # If the correct position is found and it's not out of bounds
    if current_index == index
      new_node.next_node = current
      previous.next_node = new_node unless previous.nil?
    else
      puts 'Index out of bounds'
    end
  end

  def remove_at(index)
    return nil if @head.nil?

    if index.zero?
      @head = @head.next_node
      return
    end

    current = @head
    previous = nil
    current_index = 0

    # Traverse the list to find the node right before the one to be removed
    while !current.nil? && current_index < index
      previous = current
      current = current.next_node
      current_index += 1
    end

    if !current.nil? && current_index == index
      previous.next_node = current.next_node # Bypass the current node, i.e. removing it
    else
      puts 'Index out of bounds'
    end
  end
end

# Node class for LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# test = LinkedList.new
# test.append('jack')
# test.append('bill')
# test.append('gock')
# test.prepend('cool')
