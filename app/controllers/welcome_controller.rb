class WelcomeController < ApplicationController

  layout "welcome"

  def index
    @tags = Tag.all
  end

end