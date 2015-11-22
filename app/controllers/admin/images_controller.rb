module Admin
  class ImagesController < AdminController
    before_action :set_work, only: :create
    def index
    end

    def create
      @image = @work.images.new(image_params)
      # if @image.save
      #   render json: { message: "success", fileID: @image.id }, status: 200
      # else
      #   render json: { error: @image.errors.full_messages.join(',') },
      #          status: 400
      # end
    end

    private

    def set_work
      @work = Work.find(params[:image].delete(:work_id))
    end

    def image_params
      params.permit(:url)
    end
  end
end
