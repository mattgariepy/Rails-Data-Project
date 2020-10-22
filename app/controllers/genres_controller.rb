class GenresController < ApplicationController
  def index
    @genres = Genre.select("genres.*")
                   .select("COUNT(genres.id) as song_count")
                   .left_joins(:songs)
                   .group("genres.id")
                   .order("song_count DESC")
                   .page(params[:page])
  end

  def show
    @genre = Genre.find(params[:id])

    @songs = Song.includes(:artist, :genre).where(genre_id: params[:id]).page(params[:page])
  end
end
