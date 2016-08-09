#!/usr/bin/ruby
#Used to generate a xchainkeys config file (~/.config/xchainkeys/xchainkeys.conf)
#This assumes that you have grid-wm as an alias or in your PATH (executable)
#Use this script like: ruby generate-xchainkeys.rb > ~/.config/xchainkeys/xchainkeys.config

#Should correspond to the Grid Your using in grid-wm
$tiles = [
	[ 'q', 'w', 'e', 'r', 't' ],
	[ 'a', 's', 'd', 'f', 'g' ],
	[ 'z', 'x', 'c', 'v', 'b' ]
]

#Default Chain is Windows Keys (w) and x, Change this if wanted
$chain = "C-space"

#This assumes you copied grid-wm to a folder called bin in home directory
$keyboardTilerLocation = "keyboard-tiler"

puts [
	"feedback on",
	"timeout 3000",
	"delay 0",
	"foreground white",
	"background black",
  "position 10 1051"
]

#Continous Mode (doesnt stop resizing until hit Enter/Escape)
if ARGV[0] == "moded" then
	puts [
		"#{$chain} :enter abort=manual",
		"#{$chain} Return abort=manual",
		"#{$chain} Escape abort=manual"
	]
end

def crawl(s)
	$tiles.each_with_index do |row, column|
		row.each_with_index do |cell, count|
			puts "#{$chain} #{s} #{cell} :exec #{$keyboardTilerLocation} '#{s}#{cell}'"
		end
	end
end

#Generate all permutations (2 key presses)
$tiles.each_with_index do |row, column|
	row.each_with_index do |cell, count|
		crawl(cell)
	end
end
