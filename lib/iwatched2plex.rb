#encoding: utf-8

require 'thor'

module IWatched2Plex

	APP_ENV = "devlopment"

    LIBRARY_PATH = File.join(File.dirname(__FILE__), "iwatched2plex")

    CONFIG_PATH = File.join(File.dirname(__FILE__), "..", "config")
    CONFIG_FILE = File.join(CONFIG_PATH, "config.yml")


	autoload :Version,		File.join(LIBRARY_PATH, "version")
	autoload :Config, 		File.join(LIBRARY_PATH, "config")
	autoload :Itunes, 		File.join(LIBRARY_PATH, "itunes")
	autoload :Plex, 		File.join(LIBRARY_PATH, "plex")

end