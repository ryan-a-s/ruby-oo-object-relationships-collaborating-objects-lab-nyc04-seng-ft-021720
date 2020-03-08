require_relative './artist.rb'
require_relative './mp3_importer.rb'
require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        song = self.new(filename.split(" - ")[1])
        song.artist = filename.split(" - ")[0]
        song
    end

    def artist_name=(name)
        # binding.pry
        if self.artist != name
            self.artist = Artist.new(name)
        else
            self.artist = name
        end
    end

    def self.all
        @@all
    end



end