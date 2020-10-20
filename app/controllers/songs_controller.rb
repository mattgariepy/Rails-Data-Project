class SongsController < ApplicationController
  def index
    @songs = Song.includes(:artist, :genre).order("popularity DESC").page(params[:page])
  end

  def show
    @song = Song.find(params[:id])
  end
end
