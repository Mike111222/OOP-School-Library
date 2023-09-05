require 'json'
require 'fileutils'

class SaveData
  def self.save_data_to_json(file_name, data)
    folder_path = File.dirname(file_name)

    FileUtils.mkdir_p(folder_path) unless File.directory?(folder_path)

    File.write(file_name, JSON.generate(data))
  end
end
