# rubocop:disable AbcSize
module Exhibitions
  class WorksController < ApplicationController
    def show
      @exhibition = Exhibition.find(params[:exhibition_id])
      works = @exhibition.works.includes(:artist).to_a
      idx = params[:idx].to_i
      @work = works[idx]
      @prev = idx.zero? ? works.size - 1 : idx - 1
      @next = (idx + 1) % works.size
    end
  end
end
