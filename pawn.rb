require_relative 'piece'


class Pawn < Piece
  def initialize(color, pos, board)
    super
  end

  def valid_moves(pos)
    vertical_direction = (@color == :blue) ? 1 : -1

    forward_moves(pos, vertical_direction) + attacking_moves(pos, vertical_direction)
  end

  def attacking_moves(pos, vertical_direction)
    row, col = pos
    diagonal_lt = [row + vertical_direction, col - 1]
    diagonal_rt = [row + vertical_direction, col + 1]
    attacking_positions = [diagonal_lt, diagonal_rt]

    attacking_positions.select do |attack_pos|
      @board[attack_pos] && @board[attack_pos].color != @color
    end
  end

  def forward_moves(pos, vertical_direction)
    row, col = pos
    raise ArgumentError.new("Invalid move: Can't move off board") if row + vertical_direction

    front = @board[[row + vertical_direction, col]]
    forward_moves = []

    if front.nil?
      forward_moves << [row + vertical_direction, col]
    end

    forward_moves
  end

  def show
    '♟'.colorize(@color)
  end
end
