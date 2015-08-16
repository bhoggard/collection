class WorksController < ApplicationController
  def show
    @work = Work.includes(:artist).visible.find(params[:id])
  end

  def acquire
    @work_rows = Work.recently_acquired.each_slice(4)
  end

  def recent
    @work_rows = Work.recently_updated.each_slice(4)
  end

  def featured
    @work_rows = Work.featured_works.order('artists.name').each_slice(4)
  end
end
