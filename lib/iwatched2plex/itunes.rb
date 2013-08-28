#encoding: utf-8

require 'itunes/library'

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


		def getWatchedList

			list = getWatched(VideoType::MOVIE)

			list.concat(getWatched(VideoType::TVSHOW))

			list

		end

		private

		def getWatched(type)

			list = []

			case type
				when VideoType::MOVIE
					list = @library.movies.tracks.select { |t| t.played? }

				when VideoType::TVSHOW
					list = @library.tv_shows.tracks.select { |t| t.played? }

			end

			list

		end

	end

end