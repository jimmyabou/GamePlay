class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @game_over = false
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def play_round
    number1 = rand(1..20)
    number2 = rand(1..20)
    puts "#{@current_player.name}: What Does #{number1} plus #{number2} equal"
    answer = gets.chomp.to_i

    if answer == number1 + number2
      puts "Yes! You are correct!"
    else
      puts "Seriously? No!"
      @current_player.lose_life
    end

    if @player1.lives == 0 || @player2.lives == 0
      @game_over = true
    end

    switch_players
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def start_game
    until @game_over
      play_round
    end

    if @player1.lives == 0
      winner = @player2
    else
      winner = @player1
    end

    puts "#{winner.name} wins with a score of #{winner.lives}/3!"
    puts "------Game Over-----"
  end
end
