class ExhibitionsController < ApplicationController
  def show
    @exhibition = Exhibition.find(params[:id])
    @work_rows = @exhibition.works.includes(:artist, :images).each_slice(4)
  end
end
