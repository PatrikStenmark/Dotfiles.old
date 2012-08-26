#!/usr/bin/env ruby
require 'pathname'

DotFiles = [
  "oh-my-zsh",
  "zshrc",
  "zshrc.zephaniah",
  "zshrc.izanami",
  "vim",
  "vimrc",
  "pentadactylrc",
]

HomeDir = File.expand_path("~")

puts HomeDir

DotFiles.each do |filename|
	path = Pathname.new(File.expand_path(File.dirname(__FILE__)) + "/" + filename)
	unless path.exist?
		puts "#{filename} does not exists" 
		next
	end

	link_path = Pathname.new(HomeDir + "/." + filename)

	puts "Symlinking #{link_path} to #{path}"

	if link_path.symlink?
		puts "#{filename} exists and is a symlink, assuming already installed"
		next
	end

	if link_path.exist?
		puts "#{filename} exists and is not a symlink"
		next
	end

	File.symlink(path, link_path)
end
