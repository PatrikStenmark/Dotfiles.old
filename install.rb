#!/usr/bin/env ruby
require 'pathname'

DotFiles = [
	"oh-my-zsh",
	".zshrc"
]

HomeDir = File.expand_path("~")

puts HomeDir

DotFiles.each do |filename|
	puts File.expand_path(File.dirname(__FILE__))
	path = Pathname.new(File.expand_path(File.dirname(__FILE__)) + "/" + filename)
	puts path
	source_path = HomeDir + "/." + filename

	puts "Symlinking #{source_path} to #{path}"

	if path.exist? && path.symlink?
		puts "#{filename} exists and is not a symlink"
		next
	end

	File.symlink(taget_path, source_path)
end
