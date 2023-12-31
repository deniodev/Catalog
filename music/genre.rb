class Genre
  attr_reader :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def as_json(*)
    {
      name: @name,
      items: []
    }
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
