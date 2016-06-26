#!/usr/bin/env ruby
require 'RMagick'
require 'pathname'

# based on work of calebwoods

def resize_image(file, index)
  img = Magick::Image.read(file).first
  resized = img.resize_to_fit(@size)

  extention = File.basename(file).split('.').last
  resized_path = @directory.join('resized', %Q[res_#{index}.#{extention}])
  
  resized.write(resized_path) do
    self.quality = @quality.to_i
  end

  # free up RAM
  img.destroy!
  resized.destroy!
end

def main
  unless ARGV.size == 3
    puts %Q[Usage:   ./resize.rb <directory> <max_width> <resized_image_quality>]
    puts %Q[Example: ./resize.rb images/ 800 60]
    return 1
  end

  @directory = Pathname(File.expand_path(ARGV[0]))
  @size      = ARGV.fetch(1) { 1025 }
  @quality   = ARGV.fetch(2) { 100  }

  resize_dir = "#{@directory}/resized"
  unless File.directory? resize_dir
    puts "Creating #{resize_dir}/"
    Dir.mkdir resize_dir
  end

  files = Dir.glob "#{@directory}/*.{jpg,png,gif}"

  puts "Resizing #{files.size} images..."

  files.each_with_index do |file, index|
    puts "Resizing #{file}"
    resize_image(file, index+1)
  end

  puts "Finished resizing #{files.size} images"
end

main