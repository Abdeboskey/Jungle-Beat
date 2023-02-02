require './lib/node'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(data)
    if head.nil?
      self.head = Node.new(data)
    else
      create_new_node(data)
    end
    data
  end

  def create_new_node(data)
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
end
