class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i
    index -= 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index >= 0 && index <= 8 && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    count_array = @board.select {|i| i != " "}
    count_array.length
  end

  def current_player
    count = turn_count
    if count.odd?
      "O"
    else
      "X"
    end
  end

  def turn
    puts "Please select a position 1 - 9:"
    input = gets.chomp
    input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token = "X")
      display_board
    else
      puts "Invalid move."
      turn
    end
  end
end
