class Game 
  def initialize()
    # '@' define property
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @turn = 1
  end
  
  def start()
    #loop to create multiple turns (While)
   
    while @player1.lives > 0 && @player2.lives > 0 do
      question = Question.new()
      if @turn == 1
       print "#{@player1.name}: "
      else
        print "#{@player2.name}: "
      end
      puts question.question
      answer = gets.chomp
      if question.check_answer(answer.to_i)
        puts "Right on!"
        if @turn == 1
          @turn = 2
        else
          @turn = 1
        end
      else
        puts "Good Try Mate :("
        # subtract life here 
        if @turn == 1
        @player1.lives -= 1
        @turn = 2

        else
            @player2.lives -= 1
            @turn = 1
        end
      end
    end
if @player1.lives > 0 
  puts "#{@player1.name} wins with score of #{@player1.lives}/3."
else
  puts "#{@player2.name} wins with score of #{@player2.lives}/3."
end
    puts "--- GAME OVER ---"
    puts "--- Bye Bye! ---"
  end


end

class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end

end

class Question
  attr_reader :question
  def initialize()
    # For a random number within a particular range, pass the Range 
    number1 = rand(1..20)
    number2 = rand(1..20)
    @question = "What does #{number1} plus #{number2} equal?"
    @answer = number1 + number2
  end

  def check_answer(answer)
    @answer == answer
  end
end


#starting new game
game = Game.new()
game.start()
