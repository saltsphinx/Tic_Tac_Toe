# frozen_string_literal: true

class TicTacToe
  @@record = []
  def initialize
    @player_one = Player.new(gets.chomp, "X")
    @player_two = Player.new(gets.chomp, "O")
    @game_board = GameBoard.new
    @@record.push(self)
  end

  def play_round
    @game_board.display_board
    @game_board.game_move @player_one
    @game_board.display_board
    @game_board.game_move @player_two
    @game_board.display_board
  end

  def display_board
    @game_board.display_board
  end

  def self.display_records
    @@record
  end
end

class Player
  attr_reader :name, :character
  attr_accessor :wins, :loses
  def initialize n, c
    @name = n
    @character = c
  end
end

class GameBoard
  attr_accessor :game_board
  @@game_boards = []
  def initialize
    num_pad_first = 1
    num_pad_last = 9
    @game_board = [[GridPosition.new(1), GridPosition.new(2), GridPosition.new(3)],[GridPosition.new(4), GridPosition.new(5), GridPosition.new(6)],[GridPosition.new(7), GridPosition.new(8), GridPosition.new(9)]]
    @@game_boards.push(self)
  end

  def display_board
    puts "\t\t\t\t\t\t #{@game_board[0][0].character} | #{@game_board[0][1].character} | #{@game_board[0][2].character}\n\t\t\t\t\t\t--- --- ---\n\t\t\t\t\t\t #{@game_board[1][0].character} | #{@game_board[1][1].character} | #{@game_board[1][2].character}\n\t\t\t\t\t\t--- --- ---\n\t\t\t\t\t\t #{@game_board[2][0].character} | #{@game_board[2][1].character} | #{@game_board[2][2].character}"
  end

  def game_move (player)
    position = check_correct_move(gets.chomp)
    if position.between?(1,9)
      position -= 1
      container_index = 0
      while (position - 3) >= 0
        position -= 3
        container_index += 1
      end
      puts "[#{container_index}][#{position}]"
      unless @game_board[container_index][position].filled
        @game_board[container_index][position].character = player.character
        @game_board[container_index][position].filled = true
      else
        puts 'Turn skipped.'
      end
    end
  end

  private
  def check_correct_move (move)
    move = move.to_i
    if move.between?(1, 9)
      move
    else
      0
    end
  end
end

class GridPosition
  attr_accessor :character, :filled
  def initialize c
    @character = c
    @filled = false
  end
end