#encoding: utf-8

require 'thor'

module IWatched2Plex

	class CLI < Thor
		default_task :sync

		desc "sync", "sync the Plex library with the iTunes library"
		method_option :itunes, :type => :string, :aliases => ["-i"], :desc => "The path to your iTunes library [~/Music/iTunes]"
		method_option :host, :type => :string, :aliases => ["-h"], :desc => "Your Plex host [localhost]"
		method_option :port, :type => :numeric, :aliases => ["-p"], :desc => "The Port of your Plex Server [32400]"
		def sync
			itunes_lib_path = options.itunes.nil? ? File.expand_path("~/Music/iTunes") : File.expand_path(options.itunes)
			plex_host = options.host.nil? ? "localhost" : options.host
			plex_port = options.port.nil? ? 32400 : options.port

			puts "#{itunes_lib_path} --> #{plex_host}:#{plex_port}"

			itunesLib = Itunes.new(itunes_lib_path)

			movies = itunesLib.getWatchedMovies
			movie_names = movies.map {|movie| movie.name}
			movie_names.sort_by!{ |m| m.downcase }


			plex = AJPlex.new(plex_host, plex_port)
			plex.setMoviesUnwatched(movie_names)
		end

		map "-v" => :version
		desc "version", "Display version information"
		def version
			puts "iWatched2Plex #{IWatched2Plex::Version.current}"
		end

	end

end