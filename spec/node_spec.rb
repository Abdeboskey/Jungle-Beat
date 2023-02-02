require './lib/node'

RSpec.describe Node do
  it 'exists' do
    node = Node.new("zang")

    expect(node).to be_instance_of(Node)
  end

  it 'holds some data' do
    node = Node.new("zang")

    expect(node.data).to eq("zang")
  end

  it 'can hold a reference to the next node' do
    node = Node.new("zang")

    expect(node.next_node).to eq(nil)
  end
end
