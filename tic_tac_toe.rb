# frozen_string_literal: true

# Handles object creation of other classes, method calling, game setup and play.
class TicTacToe
  def initialize
    @player_one = Player.new
    @player_two = Player.new
    @game_board = GameBoard.new
    @@record = []
    record_game
    begin_game
  end

  def begin_game
    sleep 1
    while @game_board.game_winner.nil?
      puts "#{@player_one.name}'s turn..."
      @game_board.turn @player_one
      break unless @game_board.game_winner.nil?

      puts "#{@player_two.name}'s turn..."
      @game_board.turn @player_two
    end
    call_game
  end

  def call_game
    puts "#{@game_board.game_winner.name} wins!"
    @game_board.game_winner.wins += 1
    sleep 1
    new_game
  end

  def new_game
    puts "Begin a new game?\ny/n"
    if gets.chomp.match?(/y/i)
      puts 'Beginning new game...'
      @game_board = GameBoard.new
      record_game
      begin_game
    else
      puts "Game ended.\n#{@player_one.name}'s wins: #{@player_one.wins}."
      puts "#{@player_two.name}'s wins: #{@player_two.wins}."
    end
  end

  def record_game
    @@record.push(@game_board)
  end
end

# Handles the two users information
class Player
  attr_accessor :name, :character, :wins, :loses

  def initialize
    puts 'Enter your name.'
    @name = gets.chomp
    puts 'Enter a letter to represent you.'
    while user_input = gets.chomp
      if user_input.match?(/[a-z|!|@|#|$|%|^|&|*|(|)|+|=]/i)
        @character = user_input.match(/[a-z]/i)
        break
      else
        puts 'Enter a letter.'
      end
    end
    @wins = 0
  end
end

# Is where the game is played. Displays 3x3 grid to console, and determines if alignments are created
class GameBoard
  attr_reader :game_winner

  def initialize
    @board = Array.new((1..9).map { |n| GridPosition.new(n) })
    @game_winner = nil
    @alignments = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [3, 5, 7], [4, 5, 6], [2, 5, 8], [7, 8, 9], [3, 6, 9]]
  end

  def show_board
    puts " #{@board[0].character} | #{@board[1].character} | #{@board[2].character}"
    puts '--- --- ---'
    puts " #{@board[3].character} | #{@board[4].character} | #{@board[5].character}"
    puts '--- --- ---'
    puts " #{@board[6].character} | #{@board[7].character} | #{@board[8].character}"
  end

  def turn(player)
    show_board
    user_input = gets.chomp.to_i.to_s
    if correct_move? user_input
      @board[user_input.match(/[1-9]/)[0].to_i - 1].affect player
      check_board player
    else
      puts 'That positions taken! Pick another.'
      sleep 1
      turn player
    end
  end

  def correct_move?(input)
    if input.match?(/[1-9]/) && @board[input.match(/[1-9]/)[0].to_i - 1].filled == false
      true
    else
      false
    end
  end

  def check_board(player)
    @alignments.each do |alignment|
      if alignment.all? { |i| @board[i - 1].filled == true } && alignment.all? { |i| @board[i - 1].player == player }
        @game_winner = player
        show_board
      end
    end
  end
end

# Creates instances that are used in the grid array. Prevents reuse of grid items, and is used for visuals.
class GridPosition
  attr_accessor :character, :player, :filled

  def initialize(char)
    @character = char
    @filled = false
  end

  def affect(player)
    @character = player.character
    @player = player
    @filled = true
  end
end
