# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0, 1, 2],
          [3, 4, 5],
          [6, 7, 8],
          [0, 3, 6],
          [1, 4, 7],
          [2, 5, 8],
          [0, 4, 8],
          [2, 4, 6]
        ]

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
    end
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif !won?(board) && !full?(board)
     return false
   else won?(board)
     return false
   end
end

def over?(board)
   if draw?(board) || won?(board) || full?(board)
     return true
   end
end

def win(player)
    #horizontal wins
    return true if (0..2).all? { |i| check(0, i, player) }
    return true if (0..2).all? { |i| check(1, i, player) }
    return true if (0..2).all? { |i| check(2, i, player) }
    #vertical wins
    return true if (0..2).all? { |i| check(i, 0, player) }
    return true if (0..2).all? { |i| check(i, 1, player) }
    return true if (0..2).all? { |i| check(i, 2, player) }
    #diagonal wins
    return true if (0..2).all? { |i| check(i, i, player) }
    return true if (0..2).all? { |i| check(i, 2 - i, player) }
  end
end
