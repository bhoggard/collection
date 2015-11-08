module Admin
  class WorksController < AdminController
    before_action :set_work, only: [:show, :edit, :update, :destroy]

    def index
      @filterrific = initialize_filterrific(
        Work,
        params[:filterrific]
      ) || return
      @works = @filterrific.find.page(params[:page])
    end

    def new
      @work = Work.new
    end

    def edit
    end

    def create
      @work = Work.new(work_params)

      if @work.save
        redirect_to admin_works_url,
                    notice: 'Work was successfully created.'
      else
        render :new
      end
    end

    def update
      if @work.update(work_params)
        redirect_to admin_works_url,
                    notice: 'Work was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @work.destroy
      redirect_to admin_works_url,
                  notice: 'Work was successfully deleted.'
    end

    private

    def set_work
      @work = Work.find(params[:id])
    end

    def work_params
      params.require(:work).permit(:title, :artist_id, :work_year,
                                   :work_display_date, :dimensions, :medium,
                                   :edition, :acquisition_year, :description,
                                   :provenance, :price_paid, :private_notes,
                                   :missing_information, :market_value,
                                   :market_value_year, :location_id,
                                   :category_id, :featured, :image_source,
                                   :published, :tags)
    end
  end
end
