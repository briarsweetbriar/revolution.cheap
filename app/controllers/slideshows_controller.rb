class SlideshowsController < ApplicationController
  # GET /slideshows/1.json
  def show
    @slideshow = Slideshow.find(params[:id])

    render json: @slideshow
  end
end