require 'json'

class LoadData
  def self.load_data_from_json(file_name)
    if File.exist?(file_name)
      begin
        json_data = JSON.parse(File.read(file_name))
      rescue JSON::ParserError => e
        puts "Error parsing JSON data from #{file_name}: #{e.message}"
        json_data = [] # Initialize as an empty array in case of an error
      end
    else
      json_data = [] # Initialize as an empty array if the file doesn't exist
    end
    json_data
  end
end
