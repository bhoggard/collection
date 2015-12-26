module Admin
  class ImagesController < AdminController
    before_action :set_work

    def new
      @uploader = Image.new.image_file
      @uploader.success_action_redirect = add_admin_work_images_url(@work)
    end

    def add
      @work.images.create!(path: params[:key])
      redirect_to [:admin, @work]
    end

    private

    def set_work
      @work = Work.find(params[:work_id])
    end
  end
end
