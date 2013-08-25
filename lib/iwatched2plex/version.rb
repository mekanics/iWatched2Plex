# encoding: utf-8

module IWatched2Plex

	class Version

		MAJOR, MINOR, PATCH = 0, 0, 1a

		def self.major
			MAJOR
		end

		def self.minor
			MINOR
		end

		def self.patch
			PATCH
		end

		def self.current
			"#{major}.#{minor}.#{patch}"
		end

	end

end