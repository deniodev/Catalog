require_relative '../item'
require 'json'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date = Time.now.strftime('%Y-%m-%d'))
    super(Date.parse(publish_date))
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && Time.now.year - last_played_at.year > 2
  end

  def to_json
    JSON.parse(
      game: {
        published: @publish_date,
        multiplayer: @multiplayer,
        last_played_at: @last_played_at
      }
    )
  end

  private :can_be_archived?
end
