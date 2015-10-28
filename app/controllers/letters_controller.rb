class LettersController < ApplicationController
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
      redirect_to new_letter_path
      flash[:notice] = 'Письмо добавлено в очередь'
    else
      render 'edit'
      flash[:notice] = 'Не удалось создать письмо'
    end
  end

  def edit
  end

  def update
    if resource_letter.update(letter_params)
      redirect_to letters_path
      flash[:notice] = 'Письмо обновлено'
    else
      render 'edit'
      flash[:notice] = 'Не удалось обновить письмо'
    end
  end

  def destroy
    if resource_letter.destroy
      redirect_to letters_path
      flash[:notice] = 'Письмо удалено'
    else
      redirect_to letters_path
      flash[:notice] = 'Не удалось удалить письмо'
    end
  end

  private

  def resource_letter
    @resource_letter ||= Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(:content, :status, :position)
  end
end
