class MusicImporter

    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
        @files = Dir.entries(@path)
        @files.delete_if {|name| name == "."|| name == ".."}
    end

    def import
        files.each do |file|
            Song.create_from_filename(file)
        end
    end



end