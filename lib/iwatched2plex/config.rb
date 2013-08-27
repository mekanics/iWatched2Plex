require 'yaml'

module IWatched2Plex

	class Config

		def initialize(configFile)
			@configFile = configFile
		end

		def read

			if configExists? then
				raw_config = File.read(@configFile)

				return YAML.load(raw_config)[APP_ENV]
			else
				abort "config file could not be found."
			end

		end

		private

		def configExists?

			File.exists? @configFile

		end

	end

end