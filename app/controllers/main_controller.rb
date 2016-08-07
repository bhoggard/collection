class MainController < ApplicationController
  def index
    @work = Work.featured_works.order('random()').first
  end

  # rubocop:disable MethodLength
  def installation
    @prefix = "http://s.hoggardwagner.com/fette/"
    @images = %w(
      barry_james1s.jpg
      barry_james2s.jpg
      barry_james4s.jpg
      barry_james5s.jpg
      barry_james6s.jpg
      barry_james8s.jpg
      barry_james9s.jpg
      barry_james10s.jpg
      barry_james11s.jpg
      barry_james12s.jpg
      barry_james13s.jpg
      barry_james14s.jpg
      barry_james15s.jpg
      barry_james16s.jpg
      barry_james17s.jpg
      barry_james18s.jpg
      barry_james19s.jpg
      barry_james20s.jpg
      barry_james21s.jpg
      barry_james22s.jpg
      barry_james23s.jpg
      barry_james24s.jpg
      barry_james25s.jpg
      barry_james26s.jpg
      barry_james27s.jpg
      barry_james28s.jpg
      barry_james29s.jpg
      barry_james30s.jpg
    )
    idx = params[:idx].to_i
    @image = @images[idx]
    @prev = idx.zero? ? @images.size - 1 : idx - 1
    @next = idx == @images.size - 1 ? 0 : idx + 1
  end
  # rubocop:enable MethodLength
end
