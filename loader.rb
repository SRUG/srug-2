#!/usr/bin/env /home/kuba/movies/script/runner

full_information = IMDB::FullInformation.new
now_playing = IMDB::NowPlaying.new

movies = now_playing.movies(Time.now.year, Time.now.month)
imdb_ids = movies.map { |movie| movie[:imdb_id] }

movies = imdb_ids.map do |imdb_id|
  full_information.information(imdb_id)
end

Movie.create(movies)
