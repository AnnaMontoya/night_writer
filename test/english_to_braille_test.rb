require 'minitest/autorun'
require 'minitest/emoji'
require './lib/english_to_braille'
require './lib/file_reader'
require './lib/night_write'

class EnglishToBrailleTest < Minitest::Test
  attr_reader :etb

  def setup
    @etb = EnglishToBraille.new
    @file_reader = FileReader.new
  end

  def test_class_exists
    assert_instance_of EnglishToBraille, etb 
  end

  def test_content_returns_string
    assert_equal String, etb.content.class
  end

  def test_rows_start_as_separate_strings
    assert_equal "", etb.output
    assert_equal "", etb.output_1
    assert_equal "", etb.output_2
  end

  def test_translates_capitalized_letters_correctly
    assert_equal "..0.
....
.0..
", etb.translate("A")
  end

  def test_translate_finds_lower_case_braille_character
    assert_equal "00
.0
..
", etb.translate("d")
  end

  def test_translates_english_to_braille
    expected = " !',-.?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    assert_equal "..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..
..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......
..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0
00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..
.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..
...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0
00..00..0.
.....0...0
00.000.000
", etb.translate(expected)
  end

  def test_braille_char_wrapper_restricts_80_characters_per_line
   out = "..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..00..00..0."
   out_1 = "..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0........0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00.......0...0"
   out_2 = "..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.000.000.000"

   assert_equal "..............0.0.00000.00000..0.00.0.00000.00000..0.00.0..000000...0...0...00..
..00..0...000...0....0.00.00000.00..0....0.00.00000.00..0.00...0.0......0.......
..0.0...00.000....................0.0.0.0.0.0.0.0.0.0.0000.0000000.0...0...0...0
00..0...00..00..0....0...0..0...0...00..00..0...00..00..0....0...0..0...0....0..
.0...0..0...00..00..0...00......0........0...0..0...00..00..0...00......0...00..
...0...0...0...0...0...0...00..00..00..00..00..00..00..00..00..00..000.000.0.0.0
00..00..0.
.....0...0
00.000.000
", etb.braille_char_wrapper(out, out_1, out_2)
  end
end
