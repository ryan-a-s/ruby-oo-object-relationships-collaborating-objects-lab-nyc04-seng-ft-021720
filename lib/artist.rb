require_relative './song.rb'
require_relative './mp3_importer.rb'
require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song_name)
        song_name.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        # binding.pry
        if !Artist.all.find{|artist| artist.name == artist_name}
                Artist.new(artist_name)
        end
        Artist.all.find{|artist| artist.name == artist_name}
    end

    def print_songs
        self.songs.each{|song| puts "#{song.name}"}
    end

end