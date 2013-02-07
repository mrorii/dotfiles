#!/usr/bin/env ruby

# Original: https://github.com/cho45/dotfiles/blob/master/setup.rb

require "pathname"
require "fileutils"
include FileUtils::Verbose

class String
  def expand
    ret = Pathname.new(self).expand_path
    ret.parent.mkpath unless ret.parent.exist?
    ret
  end
end

def sh(*args)
  puts args.join(" ")
  system(*args)
end

def link(src, dst)
  puts "#{src} =>\n\t#{dst}"
  src = Pathname.new(src).expand_path
  dst = Pathname.new(dst).expand_path
  dst.parent.mkpath unless dst.parent.exist?
  remove_file dst if dst.symlink?
  remove_file dst if dst.file?
  ln_sf src.to_s, dst.to_s
end


cd "~".expand

if "dotfiles".expand.exist?
  cd "dotfiles"
else
  sh "git clone --recursive git@github.com:mrorii/dotfiles.git dotfiles"
  cd "dotfiles"
end

link ".zshrc", "~/.zshrc"

link ".vimrc", "~/.vimrc"
link ".gvimrc", "~/.gvimrc"
link ".vim", "~/.vim"

link ".tmux.conf", "~/.tmux.conf"

link "git/.gitconfig", "~/.gitconfig"
link "git/.gitignore", "~/.gitignore"

cp ".gemrc", "~/.gemrc".expand unless Pathname.new("~/.gemrc").expand_path.exist?

