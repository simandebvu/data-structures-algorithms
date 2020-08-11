# Start with your code from LinkedList challenge.
class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class Stack
  attr_reader :head
  def push(val)
    new_node = Node.new(val)
    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end
  def top
    @head&.value 
  end
  def pop
    return nil if @head.nil?
    val = @head.value
    @head = @head.next_node
    val
  end
  def empty?
    return @head.nil? 
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
puts stack.pop
# => 5

stack.push(2)
stack.push(7)
puts stack.pop
# => 7

puts stack.pop
# => 2

puts stack.pop
# => 3