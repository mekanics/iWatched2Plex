#encoding: utf-8

require 'plex-ruby'
require 'colorize'

module IWatched2Plex

	class AJPlex

		def initialize(host, port)

			@host = host
			@port = port

			@plexServer = Plex::Server.new(host, port)

		end

		def setMoviesUnwatched(movie_names)
			library = @plexServer.library
			sections = library.sections
			unwatched = []

			sections.each do |section|
				puts "section #{section.type}"

				if section.type == "movie" then

					movie_names.each do |movie_name|
						pattern = Regexp.new movie_name
						movie = section.all.detect { |m| m.title =~ pattern}

						unless movie.nil? then
							puts "'#{movie_name}' found".green
						else
							puts "'#{movie_name}' could not be found".red
						end
					end


				# elsif section.type == "show" then
				# 	next
				# 	shows = section.all


				# 	dex = shows.detect { |s| s.title =~ /Dexter/ }
				# 	library.unwatched(dex.last_episode)
				end


			end


		end

	end

end
