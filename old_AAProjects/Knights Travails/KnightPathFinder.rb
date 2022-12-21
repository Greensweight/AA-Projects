
require_relative "./00_tree_node"

class KnightPathFinder
    DELTAS = [[-2, 1], [-2, 1], [-1, -2], [-1, 2], [2, 1], [2, -1],[1, 2], [1, -2]]
    
    private_constant :DELTAS

    attr_accessor :considered_positions, :root_node

    def initialize(start_pos)
        @current_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        @moves = {}
        build_move_tree 
    end

    def build_move_tree
        nodes = [root_node]

        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next_node
            end
        end
    end

    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)

        trace_path_back(end_node)
            .reverse
            .map(&:value)
    end

    def trace_path_back(end_node)
        nodes = []

        current_node = end_node
        
        until current_node.nil?
            nodes << current_node
            current_node = current_node.parent

        end
        nodes
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).reject { |el| @considered_positions.include?(el)}
        new_moves.each do |el|
            @considered_positions << el unless @considered_positions.include?(el)
        end
        new_moves
    end

    def self.valid_moves(pos)
        valid_moves = []

        cur_x, cur_y = pos
        DELTAS.map do |(dx,dy)|
            new_pos = [(cur_x + dx), (cur_y + dy)]
            if new_pos.all? { |coord| coord.between?(0,7)}
                valid_moves << new_pos
            end
        end
        
        valid_moves
    end

    if $PROGRAM_NAME == __FILE__
        kpf = KnightPathFinder.new([0,0])
        p kpf.find_path([7,7])
    end
end
