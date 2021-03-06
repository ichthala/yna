class PostsController < ApplicationController

  def recent
    # displays the 30 most recent posts
    @posts = Post.order("created_at DESC")[0..29]
    @json = @posts.to_gmaps4rails do |post, marker|
      marker.infowindow render_to_string(:partial => "post", :locals => { :post => post})
      marker.json({ :id => post.id })
    end
  end

  def my_posts
    @posts = current_user.posts
  end

  def search_results
    # search for a tag in a given area
    if params[:zipcode] != "" && params[:tag_id] != ""

      # XXX can I turn this into a single query?
      @posts = Post.near(Post.where("zipcode = \'#{params[:zipcode]}\'").first, 50) & (Tag.where("id = #{params[:tag_id]}")).first.posts.order("created_at DESC")

    # search for all posts in a given area
    elsif params[:zipcode] != ""
      @posts = Post.near(Post.where("zipcode = \'#{params[:zipcode]}\'").first, 50)

    # search for a tag
    else
      @tag = Tag.where("id = #{params[:tag_id]}").first
      @posts = @tag.posts.order("created_at DESC")[0..29]
    end

    # generate json for map display
    @json = @posts.to_gmaps4rails do |post, marker|
      marker.infowindow render_to_string(:partial => "post", :locals => { :post => post})
      marker.json({ :id => post.id })
    end
    # raise
  end

  def new
    # for error handling
    @post = Post.new
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
    @json = @post.to_gmaps4rails do |post, marker|
      marker.infowindow render_to_string(:partial => "post", :locals => { :post => post})
      marker.json({ :id => post.id })
    end
  end

  def edit
  end

  def update
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to("/users/#{current_user.id}")
  end

end