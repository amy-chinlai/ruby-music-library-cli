class Artist

    attr_accessor :name

    @@all = []    
    
    def initialize(name)
        @name = name
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

    def songs
        Song.all.select do |song|
            song.artist = self
        end
    end

    def add_song(artist)
        Song.artist = self
    end

end