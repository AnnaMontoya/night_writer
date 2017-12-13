require './lib/file_reader'
require_relative 'english_to_braille'

class NightWrite
  attr_reader :character_length
  
  def initialize
   translated_message = EnglishToBraille.new.separator
   output_file = File.open(ARGV[1], 'w')
   output_file.write(translated_message)
   output_file.close
   @character_length = translated_message.delete("\n").length
   puts "Created '#{ARGV[1]}' containing #{@character_length} characters."
  end
end

NightWrite.new
