module IWatched2Plex

	class CLI < Thor
		default_task :sync

		attr_accessor :APP_CONFIG

		def initialize(*args)
			super
			appConfig = Config.new(CONFIG_FILE)
			@APP_CONFIG = appConfig.read
		end

		desc "sync", "sync the Plex library with the iTunes library"
		def sync

			puts @APP_CONFIG


		end

		map "-v" => :version
		desc "version", "Display version information"
		def version
			puts "iWatched2Plex #{IWatched2Plex::Version.current}"
		end

	end

end