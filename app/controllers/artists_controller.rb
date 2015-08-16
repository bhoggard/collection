class ArtistsController < ApplicationController
  def index
    letters = params[:letters] || 'ab'
    @artist_rows = Artist.by_letters(letters).each_slice(4)
  end

  def show
    @artist = Artist.find(params[:id])
    @works = @artist.works.visible.order('work_year DESC')
  end
end
