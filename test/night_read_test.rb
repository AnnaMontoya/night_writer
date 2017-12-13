require 'minitest/autorun'
require 'minitest/emoji'
require './lib/night_read'

class NightReadTest < Minitest::Test
  attr_reader :nr

  def setup
    @nr = NightRead.new
  end

  def test_it_exists
    assert_instance_of NightRead, nr
  end

  def test_returns_correct_character_count
    assert_equal 59, nr.output_file_write
  end
end
