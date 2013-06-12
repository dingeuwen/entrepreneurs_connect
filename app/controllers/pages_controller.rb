class PagesController < ApplicationController

  before_filter :authenticate_user!, :except => [:aboutus]

  # GET /contents
  # GET /contents.json
  def index
    if params[:tag]
      @user = User.tagged_with(params[:tag])
    else
      # @contents = Content.all
      # @ideas = Idea.order('favorites').limit(24).reverse_order
    end

    @users = User.all.sort_by {|user| user.views}.reverse

    @founder = User.where(:id => 15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contents }
    end
  end

  def aboutus
  end

end