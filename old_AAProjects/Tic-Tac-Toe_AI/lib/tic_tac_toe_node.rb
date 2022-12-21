require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?

      return @board.won? && @board.winner != evaluator
    end

    if self.next_mover_mark == evaluator

      return self.children.all? { |node| node.losing_node?(evaluator)}
    else
      self.children.any? { |node| node.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?

      return @board.winner == evaluator
    end

    if self.next_mover_mark == evaluator
      return self.children.any? { |node| node.winning_node?(evaluator)}
    else
      self.children.all? { |node| node.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    (0..2).each do |row_idx|
      (0..2).each do |col_idx|
        pos = [row_idx,col_idx]

        #can't move there if it is not empty
        next unless @board.empty?(pos)

        new_board = board.dup
        new_board[pos] = self.next_mover_mark
        next_mover_mark = (self.next_mover_mark == :x ? :o : :x) #test exp ? if-true : if false
        #sets next mover mark to the correct mark
        children << TicTacToeNode.new(new_board, next_mover_mark, pos)
        #adds node for a potential game state after one move from current node
      end
    end
    children
  end


end
