class ArtistsController < ApplicationController
  def index
    letters = params[:letters] || 'ab'
    @artists = Artist.by_letters(letters)
  end
end
