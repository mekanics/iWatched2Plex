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
			itunesLibPath = options.itunes.nil? ? File.expand_path("~/Music/iTunes") : File.expand_path(options.itunes)
			plexHost = options.host.nil? ? "localhost" : options.host
			plexPort = options.port.nil? ? 32400 : options.port



			itunesLib = Itunes.new(itunesLibPath)

			puts "#{itunesLib.getWatchedMovies.count} watched movies/tv shows found"

			plex = AJPlex.new(@APP_CONFIG[:plex][:host], @APP_CONFIG[:plex][:port])
			plex.foo
		end

		map "-v" => :version
		desc "version", "Display version information"
		def version
			puts "iWatched2Plex #{IWatched2Plex::Version.current}"
		end

	end

end