class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @contents = @user.contents

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def update_views
    @user = User.find(params[:id])

    @user.views += 1

    respond_to do |format|
      if @user.update_attributes(params[:content])
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        format.html { redirect_to @user }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

end
