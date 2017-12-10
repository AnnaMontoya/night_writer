require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_to_english'
require './lib/character_dic'
require './lib/file_reader'


class BrailleToEnglishTest < Minitest::Test
  attr_reader :bte

  def setup
    @bte = BrailleToEnglish.new
  end

  def test_content
    assert_instance_of String, bte.content.class
  end

end
