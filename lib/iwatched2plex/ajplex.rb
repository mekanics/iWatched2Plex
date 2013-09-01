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

		def set_movies_unwatched(movies)
			movie_names = movies.map {|movie| movie.name}
			movie_names.sort_by!{ |m| m.downcase }.uniq!

			set_video_unwatched("movie", movie_names)
		end

		def set_shows_unwatched(shows)

			library = @plexServer.library
			sections = library.sections
			unwatched = []

			section_index = sections.index { |s| s.type == "show"}

			unless section_index.nil? then
				section_show = sections[section_index]

				show_names = shows.map {|s| s.show}.uniq!

				show_names.each do |show_name|
					videos_by_show = shows.find_all { |s| s.show == show_name }

					pattern = Regexp.new show_name
					plex_show = section_show.all.detect { |s| s.title =~ pattern}

					unless plex_show.nil?
						puts "#{show_name}".yellow
						seasons = videos_by_show.map { |v| v.season }.uniq!

						if seasons.nil? then
							puts "\tno seasons?".red
							next
						end

						seasons.each do |season|
							videos_by_show_season = videos_by_show.find_all { |v| v.season == season }

							plex_show_season = plex_show.season(season)

							unless plex_show_season.nil?

								videos_by_show_season.each do |episode|
									plex_show_season_episode = plex_show_season.episode(episode.episode)

									unless plex_show_season_episode.nil?
										puts "\tS#{season} E#{episode.episode} #{episode.name} set as watched".green
										library.watched(plex_show_season_episode)
									else
										puts "\tS#{season} E#{episode.episode} not found".red
									end
								end
							else
								puts "season #{season} not found.".red
								next
							end
						end

					else
						puts "show '#{show_name}' not found.".red
						next
					end
				end

			else
				puts "section 'show' not found".red
			end

		end


		private

		def set_video_unwatched(type, movie_names)
			library = @plexServer.library
			sections = library.sections
			unwatched = []

			type_found = false

			sections.each do |section|

				if section.type == type then

					puts "Start updating in section '#{type}'".yellow

					type_found = true

					movie_names.each do |movie_name|
						pattern = Regexp.new movie_name
						movie = section.all.detect { |m| m.title =~ pattern}

						unless movie.nil? then
							puts "'#{movie_name}' set as watched".green
							library.watched(movie)
						else
							puts "'#{movie_name}' could not be found".red
						end
					end

				end

			end

			unless type_found then
				puts "Video type '#{type}' could not be found".red
			end

		end

	end

end
