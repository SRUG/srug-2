imdb = IMDB::NowPlaying.new
results = imdb.movies(2008, 12)

[{ :imdb_id => "0441773", :title => "Kung Fu Panda" },
 { :imdb_id => "0493464", :title => "Wanted" }]
