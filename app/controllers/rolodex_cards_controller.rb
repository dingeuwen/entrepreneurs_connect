class RolodexCardsController < ApplicationController

  def add_to_rolodex
    @new_rolodex = RolodexCard.new
    @new_rolodex.user1_id = current_user.id
    @new_rolodex.user2_id = params[:user2]

    respond_to do |format|
      if @new_rolodex.save
        format.html { redirect_to root_path, notice: 'Profile successfully added to your rolodex' }
        format.json { render json: @user, status: :created, location: @idea }
      else
        format.html { redirect_to root_path, notice: 'Profile unsuccessfully added to your rolodex' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_from_rolodex

    @rolodex_card = RolodexCard.where("user1_id = ? AND user2_id = ?", params[:user1], params[:user2]).first

    respond_to do |format|
      if @rolodex_card.destroy
        format.html { redirect_to root_path, notice: 'Profile successfully removed from your rolodex' }
        format.json { render json: @user, status: :created, location: @idea }
      else
        format.html { redirect_to root_path, notice: 'Profile unsuccessfully removed from your rolodex' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
