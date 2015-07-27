class WorksController < ApplicationController
  def show
    @work = Work.includes(:artist).visible.find(params[:id])
  end

  def acquire
  end

  def recent
  end

  def featured
    @works = Work.includes(:artist).featured_works.order('artists.name').uniq
  end
end
