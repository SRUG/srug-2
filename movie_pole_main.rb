class MoviePoleMain < Wx::Frame
  def initialize
    super
    Wx::XmlResource.get.load_frame_subclass(self, nil, "moviepoleframe")

    @feed_list = find_window_by_id(Wx::xrcid("feedlist"))
    @feed_content = find_window_by_id(Wx::xrcid("feed"))
    @close = find_window_by_id(Wx::xrcid("close"))

    @feed = FeedNormalizer::FeedNormalizer.parse(open("http://localhost:3000/movies.rss"))
    @feed_list.set(@feed.entries.map(&:title))

    evt_button @close.id, lambda { close }
    evt_listbox @feed_list.id, :on_feed_list
  end

  def on_feed_list
    selected = @feed_list.selections.first
    @feed_content.page = @feed.entries[selected].content
  end
end
