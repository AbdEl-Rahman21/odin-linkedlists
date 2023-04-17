# frozen_string_literal: true

require_relative './node'

class LinkedList
  def initialize
    setup
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end

    @size += 1
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @head = Node.new(value, @head)
    end

    @size += 1
  end

  attr_reader :size

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    return nil unless index < @size

    i = 0
    node = @head

    loop do
      return node.value if i == index

      node = node.next_node
      i += 1
    end
  end

  def pop
    return setup if @head.next_node.nil?

    node = @head

    loop do
      if node.next_node == @tail
        node.next_node = nil
        @tail = node
        @size -= 1

        break
      else
        node = node.next_node
      end
    end
  end

  def shift
    @head = @head.next_node
    @size -= 1
  end

  def contains?(value)
    i = 0
    node = @head

    while i < @size
      return true if node.value == value

      node = node.next_node
      i += 1
    end

    false
  end

  def find(value)
    i = 0
    node = @head

    while i < @size
      return i if node.value == value

      node = node.next_node
      i += 1
    end

    nil
  end

  def to_s
    i = 0
    node = @head

    while i < @size
      print "( #{node.value} ) -> "

      node = node.next_node
      i += 1
    end

    puts 'nil'
  end

  def insert_at(value, index)
    return unless handle_index_insert?(value, index)

    i = 0
    node = @head

    loop do
      if i == index - 1
        node.next_node = Node.new(value, node.next_node)

        break
      else
        node = node.next_node
        i += 1
      end
    end
  end

  def remove_at(index)
    return unless handle_index_remove?(index)

    i = 0
    node = @head

    loop do
      if i == index - 1
        _, node.next_node = node.next_node, _.next_node

        break
      else
        node = node.next_node
        i += 1
      end
    end
  end

  private

  def setup
    @head = nil
    @tail = nil
    @size = 0
  end

  def handle_index_insert?(value, index)
    if index > @size
      puts 'Error: Invalid index.'

      return false
    elsif index == @size
      append(value)

      return false
    elsif index.zero?
      prepend(value)

      return false
    end

    true
  end

  def handle_index_remove?(index)
    if index >= @size
      puts 'Error: Invalid index.'

      return false
    elsif index.zero?
      shift

      return false
    elsif index == @size - 1
      pop

      return false
    end

    true
  end
end
