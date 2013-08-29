#encoding: utf-8

require 'itunes/library'
require 'colorize'

module VideoType
  MOVIE = 1
  TVSHOW = 2
end

module IWatched2Plex

	class Itunes

		def initialize(itunesLibPath)

			@itunesLibPath = itunesLibPath

			@library = ITunes::Library.load(File.join(@itunesLibPath, "iTunes Library.xml"))

		end

		def getWatchedMovies
			getWatched(VideoType::MOVIE)
		end

		def getWatchedShows
			getWatched(VideoType::TVSHOW)
		end


		private

		def getWatched(type)

			unless libExists?
				puts "Library path '#{@itunesLibPath}' could not be found.".red
				exit
			end

			list = []

			case type
				when VideoType::MOVIE
					list = @library.movies.tracks.select { |t| t.played? }

				when VideoType::TVSHOW
					list = @library.tv_shows.tracks.select { |t| t.played? }

			end

			list

		end

		def libExists?
			File.directory?(@itunesLibPath)
		end

	end

end