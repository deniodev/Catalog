class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived: false)
    @id = rand(1_000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    Time.now.year - publish_date.year > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?
end
