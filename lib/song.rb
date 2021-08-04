class Song

    extend Concerns::Findable
    attr_accessor :name, :genre
    attr_reader :artist

    @@all = []    
    
    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist
        self.genre=(genre) if genre
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def self.create(name)
        self.new(name)
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def self.new_from_filename(filename)
        parsed_filename = filename.split(" - ")
        song = self.new(parsed_filename[1])
        self.create(song)
        artist = Artist.find_or_create_by_name(parsed_filename[0])
        song.artist = artist
        artist.add_song(song)
        genre = Genre.find_or_create_by_name(parsed_filename[2])
        genre.name = genre.name.chomp(".mp3")
        song.genre = genre
        song
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
    end


end