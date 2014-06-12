class SlideshowImagesController < ApplicationController
  # GET /slideshow_images/1.json
  def show
    @slideshow_image = SlideshowImage.find(params[:id])

    render json: @slideshow_image
  end

  # POST /slideshow_images.json
  def create
    @slideshow_image = SlideshowImage.new(slideshow_image_params)

    authorize! :create, @slideshow_image

    if @slideshow_image.save
      render json: @slideshow_image, status: :created
    else
      render_validation_errors @slideshow_image.errors
    end
  end

  private
  def slideshow_image_params
    params.require(:slideshow_image).permit(:file)
  end
end