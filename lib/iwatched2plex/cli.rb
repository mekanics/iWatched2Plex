#encoding: utf-8

require 'thor'
require 'colorize'

module IWatched2Plex

	class CLI < Thor
		default_task :sync

		desc "sync", "sync the Plex library with the iTunes library"
		method_option :itunes, :type => :string, :aliases => ["-i"], :default => "~/Music/iTunes", :desc => "The path to your iTunes library [~/Music/iTunes]"
		method_option :host, :type => :string, :aliases => ["-h"], :default => "localhost", :desc => "Your Plex host [localhost]"
		method_option :port, :type => :numeric, :aliases => ["-p"], :default => 32400, :desc => "The Port of your Plex Server [32400]"
		def sync
			itunes_lib_path = File.expand_path(options.itunes)
			plex_host = options.host
			plex_port = options.port

			puts "#{itunes_lib_path} --> #{plex_host}:#{plex_port}".yellow

			itunesLib = AJiTunes.new(itunes_lib_path)

			movies = itunesLib.getWatchedMovies

			plex = AJPlex.new(plex_host, plex_port)
			plex.set_movies_unwatched(movies)

			shows = itunesLib.getWatchedShows
			plex.set_shows_unwatched(shows)
		end

		map "-v" => :version
		desc "version", "Display version information"
		def version
			puts "iWatched2Plex #{IWatched2Plex::Version.current}"
		end

	end

end