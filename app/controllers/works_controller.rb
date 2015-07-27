class WorksController < ApplicationController
  def show
    @work = Work.visible.find(params[:id])
  end

  def acquire
  end

  def recent
  end
end
