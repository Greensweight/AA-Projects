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
