class PolyTreeNode
    ##Phase 1

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent_node)
        @parent.children.delete(self) unless @parent == nil
        @parent = parent_node
        @parent.children << self unless parent_node == nil

    end

    def add_child(child_node)
        child_node.parent= self
    end

    def remove_child(child_node)
        raise "not a child" unless @children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result == nil
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if el.value == target_value
            el.children.each { |child| queue << child}
        end
    end
end 

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1

# connect n3 to n2
n2.parent = n3


# # this should work
#raise "Bad parent=!" unless n3.parent == n2
#raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
#raise "Bad parent=!" unless n1.children == []
