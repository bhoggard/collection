class WorksController < ApplicationController
  def show
    @work = Work.includes(:artist).visible.find(params[:id])
  end

  def acquire
    @works = Work.recently_acquired
    render :featured
  end

  def recent
    @works = Work.recently_updated
    render :featured
  end

  def featured
    @works = Work.featured_works.order('artists.name')
  end
end
