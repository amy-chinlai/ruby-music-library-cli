class Genre

    extend Concerns::Findable
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
            song.genre = self
        end
    end

    def artists
        artists_array = []
        songs.collect do |song|
            artists_array << song.artist
        end
        artists_array.uniq
    end


end