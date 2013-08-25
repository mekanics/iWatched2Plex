require 'thor'

module IWatched2Plex

    LIBRARY_PATH = File.join(File.dirname(__FILE__), "iwatched2plex")

	autoload :Version,		File.join(LIBRARY_PATH, "version")

end