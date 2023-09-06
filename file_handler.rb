require_relative 'file_types'
require 'json'

class FileHandler
  include FileTypes

  def initialize(type, data = [])
    @path = 'data/'
    @filename = get_filename(type)
    @datatype = type
    @data = data
  end

  def exists?
    File.exist?("#{@path}#{@filename}")
  end

  def empty?
    File.empty?("#{@path}#{@filename}")
  end

  def save
    Dir.mkdir(@path.to_s) unless Dir.exist?(@path)

    file_content = @data.map { |obj| JSON.generate(obj, { max_nesting: false }) }
    File.write("#{@path}#{@filename}", file_content.join("\n"))
  end

  def check_type(line)
    return get_objtype(:teacher) if line.include?('Teacher')

    return get_objtype(:student) if line.include?('Student')

    get_objtype(@datatype)
  end

  def load(books = nil, persons = nil)
    return [] unless exists? || (exists? && empty?)

    file = File.read("#{@path}#{@filename}")
    lines = file.split("\n")
    lines.map do |line|
      object_type = check_type(line)
      books.nil? && persons.nil? ? object_type.from_json(line) : object_type.from_json(line, books, persons)
    end
  end
end
