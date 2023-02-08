require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  it 'exists' do
    list = LinkedList.new

    expect(list).to be_instance_of(LinkedList)
  end

  it 'can have a head' do
    list = LinkedList.new

    expect(list.head).to eq(nil)
  end

  it 'can append a node with some data to the list' do
    list = LinkedList.new

    expect(list.append("zango")).to eq("zango")
    expect(list.head).to be_instance_of(Node)
    expect(list.head.data).to eq("zango")
    expect(list.head.next_node).to eq(nil)
    expect(list.count).to eq(1)
  end

  it 'can append multiple nodes' do
    list = LinkedList.new
    list.append("zango")
    list.append("boingo")

    expect(list.head.next_node.data).to eq("boingo")
    expect(list.count).to eq(2)
  end

  it 'can return all the data in the list as a string' do
    list = LinkedList.new
    list.append("zango")
    list.append("boingo")

    expect(list.to_string).to eq("zango boingo")
  end

  it 'can add a node to the beginning of the list' do
    list = LinkedList.new
    list.append("BMO")

    expect(list.to_string).to eq("BMO")

    list.append("Jake")
    list.prepend("Finn")

    expect(list.to_string).to eq("Finn BMO Jake")
    expect(list.count).to eq(3)
  end

  it 'can insert a node at a given index' do
    list = LinkedList.new
    list.append("BMO")
    list.append("Jake")
    list.prepend("Finn")
    list.insert(1, "Marceline")

    expect(list.to_string).to eq("Finn Marceline BMO Jake")
  end

  it 'can find one or more nodes starting at a given index' do
    list = LinkedList.new
    list.append("BMO")
    list.append("Jake")
    list.prepend("Finn")
    list.insert(1, "Marceline")
    
    expect(list.find(2, 1)).to eq("BMO")
    expect(list.find(1, 3)).to eq("Marceline BMO Jake")
  end

  it 'can check if the list includes a given string' do
    list = LinkedList.new
    list.append("BMO")
    list.append("Jake")
    list.prepend("Finn")
    list.insert(1, "Marceline")

    expect(list.includes?("Finn")).to be(true)
    expect(list.includes?("Jake")).to be(true)
    expect(list.includes?("Gunther")).to be(false)
  end

  it 'can remove and return the last item in the list' do
    list = LinkedList.new
    list.append("BMO")
    list.append("Jake")
    list.prepend("Finn")
    list.insert(1, "Marceline")

    expect(list.pop).to eq("Jake")
    expect(list.to_string).to eq("Finn Marceline BMO")
    expect(list.pop).to eq("BMO")
    expect(list.to_string).to eq("Finn Marceline")
  end
end
