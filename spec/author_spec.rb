require_relative '../game/author'
require_relative '../item'

describe 'Author test suit' do
  context 'Author add_item method' do
    let(:author) { Author.new('Felix', 'KAMANA') }
    let(:item) { Item.new('2023-08-09') }
    it 'Should initialize the Author class' do
      expect(author.class).to eq(Author)
    end
    it 'Should return author first_name and last_name' do
      expect(author.first_name).to eq('Felix')
      expect(author.last_name).to eq('KAMANA')
    end

    it 'Should add item to the item list' do
      expect(author.add_item(item))
    end

    it 'Should add item author to the current author' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end

    it 'Should add check date' do
      expect(item.publish_date).to eq('2023-08-09')
    end

    it 'should add an item to the author' do
      expect do
        author.add_item(item)
      end.to change { author.items.length }.by(1)
    end
    it 'should check whether the item is in the item list' do
      author.add_item(item)
      expect(author.items).to include(item)
    end
  end
end
