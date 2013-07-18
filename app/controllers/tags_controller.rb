class TagsController < ApplicationController

  def index_popular
    @tags = Tag.all
    @tags.sort_by! do |tag|
      tag.posts.count
    end
    @tags.reverse!
  end

  def index_alphabetical
    @tags = Tag.find(:all, :order => "LOWER(tag)")
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  end

end