require './lib/character_dic'
require './lib/file_reader'

class BrailleToEnglish
  attr_reader :content, :top, :middle, :bottom, :output

  def initialize
    reader = FileReader.new
    @content = reader.read
    @top     = ""
    @middle  = ""
    @bottom  = ""
    @output  = ""
  end

  def separator
    clean_braille = @content.split("\n")
    split_lines(clean_braille)
  end

  def split_lines(clean_braille)
    until clean_braille.empty? do
      top << clean_braille.shift
      middle << clean_braille.shift
      bottom << clean_braille.shift
    end
    translate
  end

  def translate
    caps = false

    until top.empty?
      braille = []
      braille << top.slice!(0..1)
      braille << middle.slice!(0..1)
      braille << bottom.slice!(0..1)
      char = BRAILLETOENGLISH[braille]

      if char == :cap
        caps = true
      else
        add_char_to_output(char, caps)
      end
    end
    output
  end

  def add_char_to_output(char, caps)
    if caps == true
      output << char.upcase
      caps = false
    else
      output << char
    end
  end
end
