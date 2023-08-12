require_relative '../item'
require 'json'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :title

  def initialize(multiplayer, last_played_at, title, publish_date = Time.now.strftime('%Y-%m-%d'))
    super(Date.parse(publish_date))
    @id = rand(1_000)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    super && Time.now.year - last_played_at.year > 2
  end

  def to_json(*_args)
    {
      id: @id,
      title: @title,
      published: "#{@publish_date.year}-#{@publish_date.month}-#{@publish_date.day}",
      multiplayer: @multiplayer,
      last_played_at: "#{@last_played_at.year}-#{@last_played_at.month}-#{@last_played_at.day}"
    }
  end

  private :can_be_archived?
end
