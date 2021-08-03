class Song

    attr_accessor :name
    attr_reader :artist

    @@all = []    
    
    def initialize(name, artist = nil)
        @name = name
        @artist = artist
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
    end


end