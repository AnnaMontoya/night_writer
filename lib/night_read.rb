# require './lib/character_dic'
require './lib/file_reader'
require_relative 'braille_to_english'

class NightRead
  def initialize
   translated_message = BrailleToEnglish.new.separator
   message = FileReader.new
   messages = message.read
   output_file = File.open(ARGV[1], 'w')
   output_file.write(translated_message)
   output_file.close
  end
end

NightRead.new
