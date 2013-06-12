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

  def search
    # @ideas = idea.where("title LIKE '%?%' OR description LIKE '%?%'", params[:query], params[:query])
    q = params[:query]
    # q needs to be sql-escaped, otherwise this is good to go
    # note that the tagged_with method searches for all the following
    # :skill_list, :country_list, :undergrad_list, :role_interest_list, :industry_interest_list

    users = User.where("first_name LIKE '%#{q}%' OR last_name LIKE '%#{q}%' OR email LIKE '%#{q}%'")
    tags = User.tagged_with("#{q}")
    @users = (users+tags).uniq.sort_by {|user| user.views}.reverse

    # titles = Idea.where("title LIKE '%#{q}%' OR description LIKE '%#{q}%'")
    # tags = Idea.tagged_with("#{q}")
    # @ideas = (titles+tags).uniq.sort_by {|x| x.favorites}.reverse
  end

  def search_by_tag
    q = params[:tag]
    users = User.tagged_with("#{q}")
    @users = users.uniq.sort_by {|user| user.views}.reverse

    render "/users/search.html.erb"
  end

end
