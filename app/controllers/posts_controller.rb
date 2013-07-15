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
    # for error handling
    @post = Post.new

    # for checkboxes
    @tags = Tag.all
  end

  def create
    post = Post.new
    post.text = params[:text]
    s = Geocoder.search(request.remote_ip).first
    post.latitude = s.latitude
    post.longitude = s.longitude
    tag_ids = params[:tag_ids]
    tag_ids.each do |tag_id|
      tag = Tag.find(tag_id)
      post.tags << tag
    end
    post.save
    redirect_to("/posts/#{post.id}")
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

end