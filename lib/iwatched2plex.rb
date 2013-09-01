#encoding: utf-8

require 'thor'

module IWatched2Plex

	APP_ENV = "devlopment"

    LIBRARY_PATH = File.join(File.dirname(__FILE__), "iwatched2plex")

	autoload :Version,		File.join(LIBRARY_PATH, "version")
	autoload :AJiTunes,		File.join(LIBRARY_PATH, "ajitunes")
	autoload :AJPlex, 		File.join(LIBRARY_PATH, "ajplex")
	autoload :AJVideo,		File.join(LIBRARY_PATH, "ajvideo")
	autoload :AJMovie,		File.join(LIBRARY_PATH, "ajmovie")
	autoload :AJShow,		File.join(LIBRARY_PATH, "ajshow")

end