require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'

class FileReaderTest < Minitest::Test
  def test_file_reader_exists
    filereader = FileReader.new
    assert_instance_of FileReader, filereader
  end

  def test_can_read_files
    fr = FileReader.new
    filename = ARGV[0]
    open_file = File.read(filename)

    assert_equal open_file, fr.read
  end

  def test_file_contents_are_read_as_a_string
    fr = FileReader.new
    assert_instance_of String, fr.read
  end
end
