class SongsController < ApplicationController
  def index
    @songs = Song.includes(:artist, :genre).order("popularity DESC").page(params[:page])
  end

  def show
    @song = Song.find(params[:id])
  end

  def search
    search = "%#{params[:keywords]}%"
    category = "#{params[:category]}"
    puts category

    if(category == "Songs")
      @songs = Song.includes(:artist, :genre).where("title LIKE ?", search).order("popularity DESC").page(params[:page])
    elsif (category == "Artists")
      @artists = Artist.includes(:songs).where("name LIKE ?", search).page(params[:page])
    elsif (category == "Genres")
      @genres = Genre.includes(:songs).where("name LIKE ?", search).page(params[:page])
    end
  end
end
