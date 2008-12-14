require "rubygems"
require "wx"
require "feed-normalizer"
require "open-uri"

require "movie_pole_main"

Wx::App.run do
  Wx::XmlResource.get.load("movie_pole.xrc")
  self.app_name = "Movie Pole"
  frame = MoviePoleMain.new
  frame.show
end
