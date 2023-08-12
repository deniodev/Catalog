require_relative 'author'

class AddAuthor
  def create_author
    print 'First Name: '
    first_name = gets.chomp

    print 'Last Name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    author.to_json
  end
end
