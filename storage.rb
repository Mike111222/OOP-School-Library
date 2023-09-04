class Storage
  @file_extention = 'json'
  @base_url = './'

  def self.save_data(class_name, object)
    file_path = File.expand_path("#{@base_url}#{class_name}.#{@file_extention}")
    File.write(file_path, JSON.generate(object))
  end

  def self.load_data(class_name)
    file_path = "#{@base_url}#{class_name}.#{@file_extention}"

    return [] unless File.exist?(file_path)

    data_from_file = File.read(file_path)
    JSON.parse(data_from_file, create_additions: true)
  end
end
