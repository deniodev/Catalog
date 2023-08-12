require_relative 'author'
require 'json'

class AuthorData
  def self.path
    File.expand_path('../storage/authors.json', __dir__) # Use absolute path
  end

  def self.save_data(authors)
    File.open(AuthorData.path, 'w') do |f|
      f.puts authors.to_json
    end

  end

  def self.read_data
    return [] unless File.exist?(AuthorData.path)

    begin
      JSON.parse(File.read(AuthorData.path))
    rescue JSON::ParserError
      puts "Error: Invalid JSON data in #{AuthorData.path}."
      []
    end
  end
end
