require_relative '../book/label'
require_relative '../book/book'

describe Label do
  before(:each) do
    @title = 'Poetry'
    @color = 'Gray'
    @label = Label.new(@title, @color)
    @item = Book.new('dasn', 'bad', 2023)
    @label.add_item(@item)
  end

  context 'When testing Label class' do
    it 'Should return a Label object including title and color via constructor method' do
      (
        @expected_value = @title
        expect(@label.title).to eql @expected_value
      )
      (
        @expected_value = @color
        expect(@label.color).to eql @expected_value
      )
    end

    it 'Should add the input item to the collection and label into colection of item.label' do
      expect(@label.items).to eql [@item]
      expect(@item.label).to eql @label
    end
  end
end
