class IdeasController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show, :html, :css, :update_views, :search]

  def view_user
  end

  # # GET /ideas
  # # GET /ideas.json
  # def index
  #   @ideas = idea.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @ideas }
  #   end
  # end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    @idea.views += 1
    @idea.save
    @user = @idea.user

    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  def index
    @ideas = Idea.all
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    # @idea.visible = true
    # @idea.deleted = false
    # @idea.views = 0
    # @idea.likes = 0
    # @idea.favorites = 0
    @idea.user_id = current_user.id

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea }
        format.json { head :no_idea }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update_views
    @idea = Idea.find(params[:id])

    @idea.views += 1

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea }
        format.json { head :no_idea }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update_favorites
    @idea = Idea.find(params[:id])

    if !Favorite.exists?(:idea_id => @idea.id, :user_id => current_user.id)
      @favorites = Favorite.new
      @favorites.user_id = current_user.id
      @favorites.idea_id = @idea.id
      @favorites.save
    end

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea }
        format.json { head :no_idea }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    user = @idea.user.id
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to user_show_path(user) }
      format.json { head :no_idea }
    end
  end

  def search
    # @ideas = idea.where("title LIKE '%?%' OR description LIKE '%?%'", params[:query], params[:query])
    q = params[:query]
    # q needs to be sql-escaped, otherwise this is good to go
    titles = Idea.where("title LIKE '%#{q}%' OR description LIKE '%#{q}%'")
    tags = Idea.tagged_with("#{q}")
    @ideas = (titles+tags).uniq.sort_by {|x| x.favorites}.reverse
  end

end
