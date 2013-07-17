class PostsController < ApplicationController

  def recent
    # displays the 30 most recent posts
    @posts = Post.order("created_at DESC")[0..29]
  end

  def my_posts
    @posts = current_user.posts
  end

  def search_results
    if params[:zipcode] != ""
      @zipcode = params[:zipcode]
      # binding.pry
      @posts = Post.near(Post.where("zipcode = #{@zipcode}").first, 50)
      # @posts = @posts_as_text.all.to_gmaps4rails
    else
      @tag = Tag.where("id = #{params[:tag_id]}").first
      @posts = @tag.posts
      # @posts = @posts_as_text.all.to_gmaps4rails
    end
    @json = @posts.all.to_gmaps4rails
  end

  def new
    # for error handling
    @post = Post.new

    # for checkboxes
    @tags = Tag.all
  end

  def create

    @post = Post.new(params[:post])
    @post.user = current_user

    current_location = request.location
    if current_location.data["ip"] == "127.0.0.1"
      current_location.data["ip"] = "208.185.23.206"
      current_location = Geocoder.search("208.185.23.206").first
    end
    @post.latitude = current_location.latitude
    @post.longitude = current_location.longitude
    @post.zipcode = current_location.postal_code

    if @post.save
      redirect_to @post
    else
      render :new
    end

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