require './lib/file_reader'
require_relative 'braille_to_english'

class NightRead
  def initialize
   translated_message = BrailleToEnglish.new.separator
   output_file = File.open(ARGV[1], 'w')
   output_file.write(translated_message)
   output_file.close
   puts "Created '#{ARGV[1]}' containing #{translated_message.length} characters."
  end
end

NightRead.new
