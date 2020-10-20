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
  end
end
