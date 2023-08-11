require_relative '../book/book'

describe Book do
  context 'When testing book class' do
    it 'Should return a Book object via constructor method' do
      @publisher = 'dasn'
      @cover_state = 'bad'
      @publish_date = 2023
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.publisher).to eql @publisher
      expect(@book.cover_state).to eql @cover_state
      expect(@book.publish_date).to eql @publish_date
    end

    it "should return true  if cover_state equals to 'bad' OR if parent's method returns true " do
      @publisher = 'dasn'
      @cover_state = 'bad'
      @publish_date = 2023
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.can_be_archived?).to eql true
    end

    it "should return false if cover_state equals to 'good' and if parent's method returns false " do
      @publisher = 'dasn'
      @cover_state = 'good'
      @publish_date = 2023
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.can_be_archived?).to eql false
    end
  end
end
