class LetterController < ApplicationController
  def index
    @queue = Letter.queue
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(params[:letter])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def letter_params
    params.require(:letter).permit(:content, :status, :position)
  end
end
