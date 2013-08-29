#encoding: utf-8

require 'thor'

module IWatched2Plex

	APP_ENV = "devlopment"

    LIBRARY_PATH = File.join(File.dirname(__FILE__), "iwatched2plex")

	autoload :Version,		File.join(LIBRARY_PATH, "version")
	autoload :Itunes, 		File.join(LIBRARY_PATH, "itunes")
	autoload :AJPlex, 		File.join(LIBRARY_PATH, "plex")

end