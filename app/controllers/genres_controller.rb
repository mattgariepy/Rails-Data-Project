class GenresController < ApplicationController
  def index
    @genres = Genre.all.page(params[:page])
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
