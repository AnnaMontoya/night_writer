require './lib/character_dic'
require './lib/file_reader'
require 'pry'

class EnglishToBraille
  attr_reader :content,
              :output,
              :output_1,
              :output_2

  def initialize
    reader    = FileReader.new
    @content  = reader.read
    @output   = ""
    @output_1 = ""
    @output_2 = ""
  end

  def separator
    letters = ""
    letters << @content.slice!(0) until @content.empty?
    translate(letters)
  end

  def translate(letters)
    letters.delete("\n").each_char do |letter|
      char = ENGLISHTOBRAILLE[letter]
      @output << char[0]
      @output_1 << char[1]
      @output_2 << char[2]
    end
    restrict_char_length(output, output_1, output_2)
  end

  def restrict_char_length(output, output_1, output_2)
    braille = ""
    until output.empty?
      braille << output.slice!(0..79) + "\n"
      braille << output_1.slice!(0..79) + "\n"
      braille << output_2.slice!(0..79) + "\n"
    end
    braille
    # binding.pry
  end
end
