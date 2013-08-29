#encoding: utf-8

require 'plex-ruby'

module IWatched2Plex

	class AJPlex

		def initialize(host, port)

			@host = host
			@port = port

			@plexServer = Plex::Server.new(host, port)

		end

		def foo
			library = @plexServer.library
			sections = library.sections
			unwatched = []

			sections.each do |section|
				puts "section #{section.type}"

				if section.type == "movie" then
					next
					section.unwatched.each do |x|
						puts x.title
					end

				elsif section.type == "show" then
					shows = section.all


					dex = shows.detect { |s| s.title =~ /Dexter/ }
					library.unwatched(dex.last_episode)
				end


			end


		end

	end

end
