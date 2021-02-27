#! env ruby
# frozen_string_literal: true

require 'fileutils'

if ARGV.size != 1
  puts "Need 1 argument: A folder name for the new TDD project (one that doesn't already exist)."
  exit 1
end

folder_name = ARGV[0]
project_parent_folder = File.absolute_path(File.join(__FILE__, '..', '..', '..'))

new_folder = File.join project_parent_folder, folder_name

if File.exist?(new_folder)
  puts "Error: '#{new_folder}' already exists. Won't delete/overwrite it"
  exit 1
end

FileUtils.mkdir_p new_folder

files = %w[
  lib
  spec
  Gemfile
  Guardfile
  Rakefile
]

FileUtils.cp_r files, new_folder

puts 'Created files/folders:', Dir.glob(File.join(new_folder, '**', '{*,.*}'))
Dir.chdir(new_folder) do
  puts 'Initialising git…'
  puts `git init`
  puts '', ''
  puts 'Install bundles…'
  puts `bundle install`
end
