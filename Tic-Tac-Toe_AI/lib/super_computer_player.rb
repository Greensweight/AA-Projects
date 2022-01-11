require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark) #forgot the .board

    node = node.children.find { |child| child.winning_node?(mark)} # did not know about 'find' method, this is cool
    return node.prev_move_pos if node
    
    node = node.children.find { |child| !child.losing_node?(mark)}
    return node.prev_move_pos if node

    raise " there are no winning nodes, srry m8"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
