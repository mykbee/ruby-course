# Mike B. and Andy S.

module Exercises
  # Exercise 0
  #  - Triples a given string `str`
  #  - Returns "nope" if `str` is "wishes"
  def self.ex0(str)
    # TODO
    if str == 'wishes'
      return 'nope'
    else
      str * 3
    end
  end

  # Exercise 1
  #  - Returns the number of elements in the array
  def self.ex1(array)
    # TODO
    array.size
  end

  # Exercise 2
  #  - Returns the second element of an array
  def self.ex2(array)
    # TODO
    array[1]
  end

  # Exercise 3
  #  - Returns the sum of the given array of numbers
  def self.ex3(array)
    # TODO
    array.inject(:+)
  end

  # Exercise 4
  #  - Returns the max number of the given array
  def self.ex4(array)
    # TODO
    array.max
  end

  # Exercise 5
  #  - Iterates through an array and `puts` each element
  def self.ex5(array)
    # TODO
    array.each { |x| puts x }
  end

  # Exercise 6
  #  - Updates the last item in the array to 'panda'
  #  - If the last item is already 'panda', update
  #    it to 'GODZILLA' instead
  def self.ex6(array)
    # TODO
    if array.last == "panda"
      array[-1] = "GODZILLA"
    else
      array << "panda"
    end
  end

  # Exercise 7
  #  - If the string `str` exists in the array,
  #    add `str` to the end of the array
  def self.ex7(array, str)
    # TODO
    if array.find { |x| x == str }.nil?
      return array
    else
      array << str
    end
  end

  # Exercise 8
  #  - `people` is an array of hashes. Each hash is like the following:
  #    { :name => 'Bob', :occupation => 'Builder' }
  #    Iterate through `people` and print out their name and occupation.
  def self.ex8(people)
    # TODO
    people.each { |hash| puts "#{hash[:name]}: #{hash[:occupation]}" }
  end

  # Exercise 9
  #  - Returns `true` if the given time is in a leap year
  #    Otherwise, returns `false`
  # Hint: Google for the wikipedia article on leap years
  def self.ex9(year)
    # TODO
    if year % 4 == 0 && year % 100 != 0 || year % 400 == 0
      true
    else
      false      
    end
  end
end



  # Rock, Paper, Scissors
  # Make a 2-player game of rock paper scissors. It should have the following:
  #
  # It is initialized with two strings (player names).
  # It has a `play` method that takes two strings:
  #   - Each string reperesents a player's move (rock, paper, or scissors)
  #   - The method returns the winner (player one or player two)
  #   - If the game is over, it returns a string stating that the game is already over
  # It ends after a player wins 2 of 3 games
  #
  # You will be using this class in the following class, which will let players play
  # RPS through the terminal.
class RPS
  attr_reader :p1, :p2
  attr_accessor :v1, :v2

  def initialize (p1, p2)
    @p1 = p1
    @p2 = p2
    @v1 = 0
    @v2 = 0
  end

  def play(m1, m2)
    if @v1 == 2 || @v2 == 2
      return puts "The game is already over!"
    end
    case
    when m1 == "rock"
      if m2 == "scissors"
        @v1 += 1
        return puts "#{@p1} beat #{@p2} with #{m1}!", "#{@v1} : #{@v2}"
      elsif m2 == "paper"
        @v2 += 1
        return puts "#{@p2} beat #{@p1} with #{m2}!", "#{@v1} : #{@v2}"
      else m2 == "rock"
        return puts "tie"
      end 
    when m1 == "paper"
      if m2 == "rock"
        @v1 += 1
        return puts "#{@p1} beat #{@p2} with #{m1}!", "#{@v1} : #{@v2}"
      elsif m2 == "scissors"
        @v2 += 1
        return puts "#{@p2} beat #{@p1} with #{m2}!", "#{@v1} : #{@v2}"
      else m2 == "paper"
        return puts "tie"
      end 
    when m1 == "scissors"
      if m2 == "paper"
        @v1 += 1
        return puts "#{@p1} beat #{@p2} with #{m1}!", "#{@v1} : #{@v2}"
      elsif m2 == "rock"
        @v2 += 1
        return puts "#{@p2} beat #{@p1} with #{m2}!", "#{@v1} : #{@v2}"
      else m2 == "scissors"
        return puts "tie"
      end
    end
  end
end
    
    # Example:

    # @beats = {
    #   'r' => 'p',
    #   'p' => 's',
    #   's' => 'r'
    # }

    # def play p1, p2
    #   if p1 == @beats[p2]
    #     puts "p1 wins"
    #   elsif p2 == @beats[p1]
    #     puts "p2 wins"
    #   else
    #     puts "tie"
    #   end
    # end

  # (No specs are required for RPSPlayer)
  #
  # Complete the `start` method so that it uses your RPS class to present
  # and play a game through the terminal.
  #
  # The first step is to read (gets) the two player names. Feed these into
  # a new instance of your RPS class. Then `puts` and `gets` in a loop that
  # lets both players play the game.
  #
  # When the game ends, ask if the player wants to play again.

require 'io/console'
class RPSPlayer
  attr_reader :m1, :m2
  
  def start
    puts "Player 1, enter your name!"
    @p1 = gets.chomp
    puts "Player 2, enter your name!"
    @p2 = gets.chomp
    game = RPS.new(@p1, @p2)

    until game.v1 == 2 || game.v2 == 2 do
      puts "#{@p1}, enter your move!"
      m1 = STDIN.noecho(&:gets).chomp
      puts "#{@p2}, enter your move!"
      m2 = STDIN.noecho(&:gets).chomp
      game.play(m1, m2)
    end

    puts "Do you want to play again? 'Y' or 'N'?"
    answer = gets.chomp.upcase
    if answer == 'Y'
      RPSPlayer.new.start
    else
      puts "Bye!"
    end
  end
end

RPSPlayer.new.start
    
    # TODO

    # PRO TIP: Instead of using plain `gets` for grabbing a player's
    #          move, this line does the same thing but does NOT show
    #          what the player is typing! :D
    # This is also why we needed to require 'io/console'
    # move = STDIN.noecho(&:gets)

module Extensions
  # Extension Exercise
  #  - Takes an `array` of strings. Returns a hash with two keys:
  #    :most => the string(s) that occures the most # of times as its value.
  #    :least => the string(s) that occures the least # of times as its value.
  #  - If any tie for most or least, return an array of the tying strings.
  #
  # Example:
  #   result = Extensions.extremes(['x', 'x', 'y', 'z'])
  #   expect(result).to eq({ :most => 'x', :least => ['y', 'z'] })
  #
  def self.extremes(array)
    # TODO
  end
end
