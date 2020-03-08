require_relative './artist.rb'
require_relative './song.rb'
require 'pry'

class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        # require ".#{path}"
        # binding.pry
        files = Dir.entries(path)
        files.delete_if {|file| !file.include?(".mp3")}
    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end

end