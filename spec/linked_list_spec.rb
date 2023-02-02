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
end
