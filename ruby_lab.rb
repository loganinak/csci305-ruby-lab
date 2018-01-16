#!/usr/bin/ruby

###############################################################
#
# CSCI 305 - Ruby Programming Lab
#
# <firstname> <lastname>
# <email-address>
#
###############################################################

$bigrams = Hash.new # The Bigram data structure
$name = "<firstname> <lastname>"

# function to process each line of a file and extract the song titles
def process_file(file_name)
	puts "Processing File.... "
	songs = []
	begin
		i = 0
		IO.foreach(file_name) do |line|
			# Captures the 
			title = line.match(/(?:<SEP>.+<SEP>.+<SEP>)(.+)/).captures[0]
			songs[i] = title
			i += 1
	end

		puts "Finished. Bigram model built.\n"
	rescue
		STDERR.puts "Could not open file"
		exit 4
	end

	songs.each do |title|
		title = title.sub(/([\(\[{\\\/_\-:"`+=*]|feat.).+/, '')
		title = title.gsub(/[?¿!¡\.;&@%#|]/, '')
		puts title
	end
end

# Executes the program
def main_loop()
	puts "CSCI 305 Ruby Lab submitted by #{$name}"

	if ARGV.length < 1
		puts "You must specify the file name as the argument."
		exit 4
	end

	# process the file
	process_file(ARGV[0])

	# Get user input
end

main_loop()
