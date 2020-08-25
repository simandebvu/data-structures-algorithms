# Transposition
# A Transposition Error is when two letters are swapped, such as in "hte" instead of "the", or "rign" instead of "ring".
# Given a string of characters, can you fix every place where "gn"  appears so it becomes "ng" instead? If there are multiple "g"s in a row,  the "n" should be swapped with the first "g". No "gn" should appear in  the final text, so be careful with all possibilities!

# Full Credit

# Try to solve this challenge with only one pass through the text.

class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
  end

class Deque
  def initialize
    @first = Node.new(nil)
    @last = @first
    end

  def pushFront(number)
    @first = Node.new(number, @first)
    @last = @first if @last.value.nil?
    end

  def pushBack(number)
    pushFront(number) && return if @first.value.nil?

    @last.next_node = Node.new(number)
    @last = @last.next_node
    end

  def popFront
    if @last == @first
      @first = Node.new(nil)
      @last = @first
      return
    end
    @first = @first.next_node
    end

  def empty_into(container)
    current = @first
    while current
      container << current.value unless current.value.nil?
      popFront
      current = current.next_node
    end
    end

  def topFront
    raise 'Empty' if empty?

    @first.value
    end

  def topBack
    raise 'Empty' if empty?

    @last.value
    end

  def empty?
    @first.value.nil?
    end
end

def transpose(string)
  deque = Deque.new
  result = ''
  (0..string.length).each do |i|
    if string[i] == 'g'
      deque.pushBack(string[i])
      next
    elsif string[i] == 'n'
      deque.pushFront(string[i])
      next
    else
      deque.empty_into(result) unless deque.empty?
      end

    result += string[i] if string[i] != 'g' && string[i] != 'n' && string[i]
  end
  result
end
