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
    current_location = request.location
    if current_location.data["ip"] == "127.0.0.1"
      current_location.data["ip"] = "208.185.23.206"
      current_location = Geocoder.search("208.185.23.206").first
    end
    post.latitude = current_location.latitude
    post.longitude = current_location.longitude
    post.zipcode = current_location.postal_code

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