class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @user.views += 1
    @user.save
    @ideas = @user.ideas

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

end
