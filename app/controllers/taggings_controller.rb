class TaggingsController < ApplicationController
  # GET /taggings.json
  def index
    @taggings = QueryParams.new(Tagging, params).build

    render json: @taggings
  end

  # GET /taggings/1.json
  def show
    @tagging = Tagging.find(params[:id])

    render json: @tagging
  end
end