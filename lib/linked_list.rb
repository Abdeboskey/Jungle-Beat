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
    #if head.nil?
    #  return 0
    #else
    #  nodes = 1
    #  current_node = head
    #  until current_node.next_node.nil? do
    #    nodes += 1 
    #    current_node = current_node.next_node
    #  end
    #  return nodes
    #end
    get_all_nodes.length
  end

  def to_string
    #nodes = []
    #current_node = head
    #while nodes.length < count do
    #  nodes << current_node
    #  current_node = current_node.next_node
    #end
    #stringify(nodes)
    stringify(get_all_nodes)
  end

  def find(position, num_elements)
    #current_node = head
    #position.times do
    #  current_node = current_node.next_node
    #end
    #nodes = []
    #num_elements.times do
    #  nodes << current_node
    #  current_node = current_node.next_node
    #end
    #stringify(nodes)
    nodes = get_all_nodes
    stringify(nodes[position, num_elements])
  end

  def includes?(string)
    stringify(get_all_nodes).include?(string)
  end

  def get_all_nodes
    nodes = []
    current_node = head
    until current_node.next_node.nil? do
      nodes << current_node
      current_node = current_node.next_node
    end
    nodes << current_node
    nodes
  end

  def pop
    nodes = get_all_nodes
    popped_data = nodes[-1].data.to_s
    nodes[-2].next_node = nil
    popped_data
  end

  def stringify(nodes)
    nodes.map { |node| node.data.to_s }.join(" ")
  end
end
