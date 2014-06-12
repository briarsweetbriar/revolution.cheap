class TagsController < ApplicationController
  # GET /tags.json
  def index
    @tags = QueryParams.new(Tag, params).build

    render json: @tags
  end

  # GET /tags/1.json
  def show
    @tag = Tag.friendly.find(params[:id])

    render json: @tag
  end
end