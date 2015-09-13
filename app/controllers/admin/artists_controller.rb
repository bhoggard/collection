module Admin
  class ArtistsController < AdminController
    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
      @filterrific = initialize_filterrific(
        Artist,
        params[:filterrific]
      ) || return
      @artists = @filterrific.find.page(params[:page])
    end

    def new
      @artist = Artist.new
    end

    def edit
    end

    def create
      @artist = Artist.new(artist_params)

      if @artist.save
        redirect_to admin_artists_url,
                    notice: 'Artist was successfully created.'
      else
        render :new
      end
    end

    def update
      if @artist.update(artist_params)
        redirect_to admin_artists_url,
                    notice: 'Artist was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @artist.destroy
      redirect_to admin_artists_url,
                  notice: 'Artist was successfully deleted.'
    end

    private

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :sort_name, :home_page,
                                     :birth_year, :gender, :death_year, :notes,
                                     :show_large_images, :email, :telephone,
                                     :address, :private_notes,
                                     :missing_information, :nationality_id)
    end
  end
end
