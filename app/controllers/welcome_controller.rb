class WelcomeController < ApplicationController

  def index
    @tags = Tag.all
  end

  def error
  end

end