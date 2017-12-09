require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test
  def test_file_reader_exists
    filereader = FileReader.new

    assert_instance_of FileReader, filereader
  end
end
