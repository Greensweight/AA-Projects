
require_relative "./00_tree_node"

class KnightPathFinder
    DELTAS = [[-2, 1], [-2, 1], [-1, -2], [-1, 2], [2, 1], [2, -1],[1, 2], [1, -2]]
    
    attr_accessor :considered_positions

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree 
    end

    def build_move_tree

    end

    def find_path
    end

    def new_move_positions(pos)
        new_moves = valid_moves(pos).reject { |el| @considered_positions.include?(el)}
        new_moves.each do |el|
            @considered_positions << el unless @considered_positions.include?(el)
        end
        new_moves
    end

    def valid_moves(pos)
        row,col = pos
        DELTAS.map do |delta|
            x,y = delta
            if (row + x).between?(0,7) && (col+y).between?(0,7)
                [x + row, col + y]
            end
        end
    end


end
