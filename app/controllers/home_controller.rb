class HomeController < ApplicationController
  def index
    @songs = Song.includes(:artist, :genre).order("popularity DESC").limit(5)

    @artists = Artist.select("artists.*")
                     .select("COUNT(artists.id) as song_count")
                     .left_joins(:songs)
                     .group("artists.id")
                     .order("song_count DESC")
                     .limit(5)

    @genres = Genre.select("genres.*")
                   .select("COUNT(genres.id) as song_count")
                   .left_joins(:songs)
                   .group("genres.id")
                   .order("song_count DESC")
                   .limit(5)
  end
end
