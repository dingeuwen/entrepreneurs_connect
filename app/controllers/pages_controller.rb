class PagesController < ApplicationController

  # GET /contents
  # GET /contents.json
  def index
    if params[:tag]
      @ideas = Idea.tagged_with(params[:tag]).order('favorites').reverse
    else
      # @contents = Content.all
      @ideas = Idea.order('favorites').limit(24).reverse_order
    end

    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  def aboutus
  end

end