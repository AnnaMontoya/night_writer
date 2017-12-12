require 'minitest/autorun'
require 'minitest/emoji'
require './lib/braille_to_english'
require './lib/file_reader'
require './lib/night_read'

class BrailleToEnglishTest < Minitest::Test
  attr_reader :bte, :file_reader
  attr_accessor :content

  def setup
    @bte = BrailleToEnglish.new
    @file_reader = FileReader.new
  end

  def test_class_exists
    assert_instance_of BrailleToEnglish, bte
  end

  def test_content_returns_string
    assert_equal String, bte.content.class
  end

  def test_rows_start_as_separate_strings
    assert_equal "", bte.top
    assert_equal "", bte.middle
    assert_equal "", bte.bottom
  end

  def test_separator_returns_braille_to_english_translation
    actual = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    assert_equal actual, bte.separator
  end

  def test_capitalization_checker_checks_capitalization_of_single_letter
    assert_equal 'A', bte.capitalization_checker('A')
  end

  def test_capitalization_checker_checks_capitalization_of_multiple_letters
    assert_equal 'Anna', bte.capitalization_checker('Anna')
  end

  def test_capitalization_checker_checks_capitalization_of_each_letter_of_multiple_words
  assert_equal 'luiS Garcia', bte.capitalization_checker('luiS Garcia')
  end
end
