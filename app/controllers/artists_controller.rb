class ArtistsController < ApplicationController
  def index
    letters = params[:letters] || 'abc'
    @artists = Artist.by_letters(letters)
  end
end
