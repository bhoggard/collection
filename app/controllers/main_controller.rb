class MainController < ApplicationController
  def index
    @work = Work.featured_works.order('random()').first
  end
end
