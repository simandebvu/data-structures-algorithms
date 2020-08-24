class Node
    attr_accessor :value, :next_node
    def initialize(value, next_node = nil)
        @value = value
        @next_node = next_node
    end
end

class LinkedList
    def initialize
        @head = nil
        @tail = nil
    end

    def add(value)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            @tail.next_node = new_node
            @tail = new_node
        end
    end

    def add_at(value, idx)
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        elsif idx == 0
            new_node.next_node = @head
            @head = new_node
        else
            prev_node = get_node(idx - 1)
            next_node = prev_node&.next_node
            prev_node.next_node = new_node
            new_node.next_node = next_node
        end
    end

    def get(idx)
        node = get_node(idx)
        node&.value
    end

    def remove(idx)
        if index == 0
            value = @head.value
            @head = @head&.next_node
            return value
        end
        prev_node = get_node(idx - 1)
        value = prev_node.next_node.value
        prev_node.next_node = prev_node&.next_node&.next_node

        if prev_node == @tail
            @tail = prev_node
        end
        value
    end
    private

    def get_node(idx)
        node = @head
        while idx > 0 && node
            node = node.next_node
            idx -= 1
        end
        node
    end
end