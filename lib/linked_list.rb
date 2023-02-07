require './lib/node'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def create_head_node(data)
    self.head = Node.new(data)
  end

  def append(data)
    head.nil? ? create_head_node(data) : create_new_tail(data)
    data
  end

  def prepend(data)
    if head.nil?
      create_head_node(data)
    else
      new_node = Node.new(data)
      new_node.next_node = head
      self.head = new_node
    end
  end

  def insert(position, data)
    new_node = Node.new(data)
    current_node = head
    prev_position = position - 1
    prev_position.times do
      current_node = current_node.next_node
    end
    new_node.next_node = current_node.next_node
    current_node.next_node = new_node
    data
  end

  def create_new_tail(data)
    current_node = head
    until current_node.next_node.nil? do
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(data)
  end

  def count
    if head.nil?
      return 0
    else
      nodes = 1
      current_node = head
      until current_node.next_node.nil? do
        nodes += 1 
        current_node = current_node.next_node
      end
      return nodes
    end
  end

  def to_string
    strings = []
    current_node = head
    while strings.length < count do
      strings << current_node.data.to_s
      current_node = current_node.next_node
    end
    strings.join(" ")
  end

  def find(position, num_elements)
    current_node = head
    position.times do
      current_node = current_node.next_node
    end

    strings = []
    num_elements.times do
      strings << current_node.data.to_s
      current_node = current_node.next_node
    end

    strings.join(" ")
  end
end
