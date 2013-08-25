module IWatched2Plex

	class CLI < Thor
		default_task :sync

		desc "sync", "sync the Plex library with the iTunes library"
		def sync
			puts "sync iTunes to Plex"
		end

		map "-v" => :version
		desc "version", "Display version information"
		def version
			puts "iWatched2Plex #{IWatched2Plex::Version.current}"
		end

	end

end