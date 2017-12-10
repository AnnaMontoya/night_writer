require './lib/file_reader'
require_relative 'english_to_braille'

class NightWrite
  def initialize
   translated_message = EnglishToBraille.new.separator
   output_file = File.open(ARGV[1], 'w')
   output_file.write(translated_message)
   output_file.close
   puts "Created '#{ARGV[1]}' containing #{translated_message.length} characters."
  end
end

NightWrite.new
