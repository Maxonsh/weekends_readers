class LettersController < ApplicationController

  def index
    @queue = Letter.queue
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)

    if @letter.save!
      redirect_to new_letter_path
    else
      render 'edit'
    end
  end

  def edit
    @letter = Letter.find(params[:id])
  end

  def update
    @letter = Letter.find(params[:id])

    if @letter.update(letter_params)
      redirect_to letters_path
    else
      render 'edit'
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    redirect_to letters_path if @letter.destroy
  end

  private

  def letter_params
    params.require(:letter).permit(:content, :status, :position)
  end
end
