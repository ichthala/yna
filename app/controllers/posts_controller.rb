class PostsController < ApplicationController

  # For testing purposes only
  def index
  end

  def search_results
    @zip = params[:zip]
    # @tag = params[:tag]
    @posts = Post.where("zip = #{@zip}")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.text = params[:text]
    s = Geocoder.search(request.remote_ip).first
    @post.latitude = s.latitude
    @post.longitude = s.longitude
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

end