class Stack
  attr_accessor :stack, :min_stack

  def initialize
    @stack = []
    @min_stack = []
  end

  def push(number)
    @stack.push(number)
    @min_stack.push(number) if @min_stack.empty? || min >= number
  end

  def pop
    @min_stack.pop if top == min
    @stack.pop
  end

  def top
    @stack.last
  end

  def min
    @min_stack.last
  end
end
