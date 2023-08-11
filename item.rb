class Item
  attr_reader :genre
  attr_accessor :author, :source, :label, :publish_date

  def initialize(publish_date, archived = false)
    @id = rand(1...1000)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    arc = Time.now.year - @publish_date

    arc > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private :can_be_archived?

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
