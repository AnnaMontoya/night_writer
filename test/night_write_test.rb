require 'minitest/autorun'
require 'minitest/emoji'
require './lib/night_write'

class NightWriteTest < Minitest::Test
  attr_reader :nw

  def setup
    @nw = NightWrite.new
  end

  def test_it_exists
    assert_instance_of NightWrite, nw
  end

  def test_returns_correct_character_count
    assert_equal 510, nw.character_length
  end
end
