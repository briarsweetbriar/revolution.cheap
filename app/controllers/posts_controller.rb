class PostsController < ApplicationController
  # GET /posts.json
  def index
    @posts = QueryParams.new(Post, params).build

    render json: @posts
  end

  # GET /posts/1.json
  def show
    @post = Post.friendly.find(params[:id])

    render json: @post
  end

  # POST /posts.json
  def create
    authorize! :create, Post.new

    @post = Post.new(post_params)

    if @post.save
      render json: @post, status: :created
    else
      render_validation_errors @post.errors
    end
  end

  # PATCH/PUT /posts/1.json
  def update
    @post = Post.friendly.find(params[:id])

    authorize! :update, @post

    if @post.update(post_params)
      head :no_content
    else
      render_validation_errors @post.errors
    end
  end

  # DELETE /posts/1.json
  def destroy
    @post = Post.friendly.find(params[:id])

    authorize! :update, @post
    @post.destroy

    head :no_content
  end

  private
  def post_params
    params.require(:post).permit(:title, :body,
      taggings_attributes: [:tag_id]
    ).merge(user: current_user)
  end
end