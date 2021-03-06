class AngularController < ApplicationController
  layout 'angular'

  def index; end

  def list
    render json: get_posts_index
  end

  def create
    @post = Post.new quiet_post_params

    response = if @post.save
      {
        post:   @post,
        notice: "Post was successfully created."
      }
    else
      { errors: @post.errors }
    end

    render json: response
  end
end
