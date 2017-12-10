require './lib/character_dic'
require './lib/file_reader'
require 'pry'

class EnglishToBraille
  attr_reader :content

  def initialize
    reader   = FileReader.new
    @content = reader.read
  end

  def separator
    letters = ""
    letters << @content.slice!(0) until @content.empty?
    translate(letters)
  end
end
