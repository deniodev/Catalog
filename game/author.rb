require 'json'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = rand(1_000_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    items << item unless items.include?(item)
    item.author = self
  end

  def to_json
    JSON.parse(
      author: {
        id: @id,
        first_name: @first_name,
        last_name: @last_name,
        item: @item
      }
    )
  end
end
