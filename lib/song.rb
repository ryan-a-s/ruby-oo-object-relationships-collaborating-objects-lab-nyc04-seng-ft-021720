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
        song = Song.new(filename.split(" - ")[1])
        artist = filename.split(" - ")[0]
        song.artist_name=(artist)
        song
    end

    def artist_name=(artist_name)
        # binding.pry
        new_artist = Artist.find_or_create_by_name(artist_name)
        self.artist = new_artist
    end

    def self.all
        @@all
    end

end