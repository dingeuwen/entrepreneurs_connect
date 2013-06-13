class CommentsController < ApplicationController

  before_filter :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  # def new
  #   @comment = Comment.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @comment }
  #   end
  # end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.idea_id = params[:idea_id]
    @comment.comment = params['comment']['comment']

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.idea, notice: 'Comment was successfully created.' }
        format.json { render json: @idea, status: :created, location: @comment }
      else
        # format.html { render action: "new" }
        format.html { redirect_to(@idea, :notice =>
        'Comment could not be saved. Please fill in all fields')}
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @idea = @comment.idea

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_idea }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @idea = idea.find(params[:idea_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@idea, :notice => 'Comment was successfully deleted.') }
      format.json { head :no_idea }
    end
  end
end
