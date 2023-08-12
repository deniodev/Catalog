require_relative 'game'

class AddGame
  def create_game
    print 'Add title: '
    title = gets.chomp

    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = answer_yes?

    print 'When was the game published? (YYYY-MM-DD): '
    publish_date = gets.chomp

    print 'When was the last time it was played? (YYYY-MM-DD): '
    last_played_at = gets.chomp

    game = Game.new(multiplayer, last_played_at, title, publish_date) unless publish_date.empty?
    game = Game.new(multiplayer, last_played_at, title) unless !publish_date.empty?
    game.to_json
  end

  def answer_yes?
    answer = gets.chomp
    until %w[y yes n no true false].include?(answer.downcase)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp
    end
    %w[y yes true].include?(answer.downcase)
  end
end