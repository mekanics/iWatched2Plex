#encoding: utf-8

module IWatched2Plex

	class AJShow < AJVideo

		attr_reader :show
		attr_reader :season
		attr_reader :episode

		def initialize(name, show, season, episode)
			super(name)
			@show = show
			@season = season
			@episode = episode
		end

	end

end