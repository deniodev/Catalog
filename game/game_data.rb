require 'json'

class GameData
  def self.path
    File.expand_path('../storage/games.json', __dir__) # Use absolute path
  end

  def self.save_data(games)
    File.open(GameData.path, 'w') do |f|
      f.puts games.to_json
    end
    puts 'Games saved successfully.'
  rescue Errno::ENOENT => e
    puts "Error: #{e.message}"
  end

  def self.read_data
    return [] unless File.exist?(GameData.path)

    JSON.parse(File.read(GameData.path))
  end
end
