class MinStack
  def initialize
    @main_stack = Stack.new
    @min_stack = Stack.new
  end

  def push(number)
    @main_stack.push(number)
    @min_stack.push(number) if @min_stack.empty? || @min_stack.top.value >= number
  end

  def pop
    removed_node = @main_stack.pop
    @min_stack.pop if removed_node && @min_stack.top.value == removed_node.value
    removed_node
  end

  def min
    return nil if @min_stack.empty?

    @min_stack.top.value
  end
end

class Node
  attr_accessor :value, :next_node
  attr_reader :top

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  def initialize
    @top = nil
    @bottom = nil
  end

  def push(number)
    new_node = Node.new(number)
    if @top.nil?
      @top = new_node
    else
      new_node.next_node = @top
      @top = new_node
    end
  end

  def pop
    return nil if @top.nil?

    value = @top
    @top = @top.next_node
    value
  end

  def empty?
    @top.nil?
  end
end
