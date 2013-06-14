class MessageBoardsController < ApplicationController
  def new
    @message_board = MessageBoard.new
  end

  def create
    @message_board = MessageBoard.new(params[:message_board])

    respond_to do |format|
      if @message_board.save
        format.html { redirect_to :action => "show", :id => @message_board.id, notice: 'discussion successfully created.' }
        # format.html { redirect_to @message_board, notice: 'discussion successfully created.' }
        format.json { render json: @message_board, status: :created, location: @message_board }
      else
        format.html { render action: "new" }
        format.json { render json: @message_board.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @message_board = MessageBoard.all
  end

  def show
  end
end
