require 'minitest/autorun'
require 'minitest/emoji'
require './lib/english_to_braille'
require './lib/file_reader'
require './lib/night_write'
require 'pry'

class EnglishToBrailleTest < Minitest::Test
  attr_reader :etb

  def setup
    @etb = EnglishToBraille.new
    @file_reader = FileReader.new
  end

  def test_content_returns_string
    assert_equal String, etb.content.class
  end

  def test_content_holds_english_characters_from_file
    actual = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    assert_equal actual, etb.content
  end

  def test_rows_start_as_separate_strings
    assert_equal "", etb.output
    assert_equal "", etb.output_1
    assert_equal "", etb.output_2
  end

  def test_capitalization_checker_checks_capitalization_of_single_letter
    assert_equal "..0.
    ....
    .0..
    ", etb.translate("A")
  end

  def test_capitalization_checker_checks_capitalization_of_multiple_letters
    skip
    assert_equal 'Anna', bte.capitalization_checker('Anna')
  end

  def test_capitalization_checker_checks_capitalization_of_each_letter_of_multiple_words
  skip
  assert_equal 'luiS Garcia', bte.capitalization_checker('luiS Garcia')
  end

end
