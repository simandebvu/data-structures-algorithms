class Node 
    attr_accessor :value, :next_node
    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end
  end
  
  class Stack
    def initialize
      @top = nil
    end
    
    def push(val)
      new_node = Node.new(val)
      if @top.nil?
        @top = new_node
      else
        new_node.next_node = @top
        @top = new_node
      end
    end
    
    def top
      if @top.nil?
        return nil
      else
        @top.value
      end
    end
    
    def pop
      return nil if @top.nil?
      removed_node = @top
      @top = @top.next_node
      removed_node
    end 
    
    def empty?
      @top.nil?
    end
  end
  
  def balanced_brackets?(string)
    mStack = Stack.new
    openers = ['[', '(', '{']
    closers = [']', ')', '}']
    string.split('').each do |c| 
      if openers.include?(c)
        mStack.push(c) 
      end
      if closers.include?(c)
        current = mStack.top()
        #p "CURRENT #{current} compared with #{c}"
        if current == "(" && c == ")"
          mStack.pop()
        end
        if current == "[" && c == "]"
          mStack.pop()
        end
        if current == "{" && c == "}"
          mStack.pop()
        end
      end
    end
    return mStack.empty?
  end
  
  puts balanced_brackets?('(hello)[world]')
  # => true
  puts balanced_brackets?('([)]')
  # => false
  puts balanced_brackets?('[({}{}{})([])]')
  # => true