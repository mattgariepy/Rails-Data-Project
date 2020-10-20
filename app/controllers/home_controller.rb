class HomeController < ApplicationController
  def index
    @songs = Song.includes(:artist, :genre).order("popularity DESC").limit(15)
    @artists = Artist.limit(15)
    @genres = Genre.limit(15)
  end
end
