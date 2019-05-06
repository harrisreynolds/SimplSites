class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def privacy
  end

  def terms
  end
end
