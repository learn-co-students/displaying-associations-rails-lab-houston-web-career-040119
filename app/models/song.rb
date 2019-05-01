class Song < ActiveRecord::Base
  belongs_to :artist
  def artist_name
    self.artist ? self.artist.name : ""
  end

  def my_artist_path
    if self.artist
      "/artists/#{self.artist.id}"
    else
      ""
    end
  end
end
