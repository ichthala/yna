class TagsController < ApplicationController

  def index
    @tags = Tags.all
  end

  def show
  end

end