require 'json'
require 'fileutils'

class SaveData
  def self.save_data_to_json(file_name, data)
    folder_path = File.dirname(file_name)
    
    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

    File.open(file_name, 'w') do |file|
      file.write(JSON.generate(data))
    end
  end
end
