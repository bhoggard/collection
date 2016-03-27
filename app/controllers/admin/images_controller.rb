module Admin
  class ImagesController < AdminController
    before_action :set_work, only: [:new, :add]

    def new
      @uploader = Image.new.image_file
      @uploader.success_action_redirect = add_admin_work_images_url(@work)
    end

    def add
      @work.images.create!(path: params[:key])
      redirect_to [:admin, @work]
    end

    def destroy
      image = Image.find(params[:id])
      @work = image.work
      @work.images.destroy(image)
      render partial: 'admin/works/image',
             collection: @work.images.order(:position)
    end

    def caption_edit
      image = Image.find(params[:pk])
      if image.update_attributes(caption: params[:value])
        render nothing: true
      else
        render image.errors.full_messages, status: 400
      end
    end

    private

    def set_work
      @work = Work.find(params[:work_id])
    end
  end
end
