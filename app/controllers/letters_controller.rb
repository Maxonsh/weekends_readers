class LettersController < ApplicationController
  before_action :authenticate
  helper_method :resource_letter

  def index
    @queue = Letter.queue
  end

  def new
    @resource_letter = Letter.new
  end

  def create
    @resource_letter = Letter.new(letter_params)

    if @resource_letter.save
      redirect_to new_letter_path, notice: t('.notice')
    else
      flash.now[:error] = t('.error')
      render 'new'
    end
  end

  def edit
  end

  def update
    if resource_letter.update(letter_params)
      redirect_to letters_path, notice: t('.notice')
    else
      flash.now[:error] = t('.error')
      render 'edit'
    end
  end

  def destroy
    if resource_letter.destroy
      redirect_to letters_path, notice: t('.notice')
    else
      redirect_to letters_path, error: t('.error')
    end
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.secrets.user && password == Rails.application.secrets.pass
    end
  end

  def resource_letter
    @resource_letter ||= Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:content, :status, :position)
  end
end
