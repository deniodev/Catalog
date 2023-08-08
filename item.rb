class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived

  def initialize(genre, author, source, label, publish_date)
    @id = rand(1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    @publish_date > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?
end
