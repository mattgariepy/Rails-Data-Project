class ArtistsController < ApplicationController
  def index
    @artists = Artist.select("artists.*")
                     .select("COUNT(artists.id) as song_count")
                     .left_joins(:songs)
                     .group("artists.id")
                     .order("song_count DESC")
                     .page(params[:page])

  end

  def show
    @artist = Artist.find(params[:id])

    @songs = Song.includes(:artist, :genre).where(artist_id: params[:id]).page(params[:page])
  end
end
