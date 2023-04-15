require_relative "./node.rb"

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @head.next_node
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

  def size
    @size
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    i = 0
    node = @head

    loop do
      if i == index
        return node.value
      else
        node = node.next_node
        i += 1
      end
    end
  end

  def pop
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

  def contains?(value)
    i = 0
    node = @head

    while i < @size
      if node.value == value
        return true
      else
        node = node.next_node
        i += 1
      end
    end

    return false
  end

  def find(value)
    i = 0
    node = @head

    while i < @size
      if node.value == value
        return i
      else
        node = node.next_node
        i += 1
      end
    end

    return nil
  end

  def to_s
    i = 0
    node = @head

    while i < @size
      print "( #{node.value} ) -> "

      node = node.next_node
      i += 1
    end

    puts "nil"
  end

  def insert_at(value, index)
    i = 0
    node = @head

    while i < @size
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
    i = 0
    node = @head

    while i < @size
      if i == index - 1
        temp = node.next_node
        node.next_node = temp.next_node
        break
      else
        node = node.next_node
        i += 1
      end
    end
  end
end

a = LinkedList.new

a.append(3)

a.append(4)

a.prepend(2)

a.prepend(1)

puts "Size: #{a.size} \t Head: #{a.head} \t Tail: #{a.tail}"

p a.at(1)

p a.pop

p a.contains?(4)

p a.find(3)

a.to_s

p a.insert_at(100, 2)

p a.remove_at(2)

p a
