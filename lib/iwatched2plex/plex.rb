#encoding: utf-8

require 'plex-ruby'

module IWatched2Plex

	class Plex

		def initialize(host, port)

			@host = host
			@port = port

			@plexServer = Plex::Server.new(host, port)

			puts sections = server.library.sections

		end

	end

end
