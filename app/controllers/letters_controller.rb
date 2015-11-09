class LettersController < ApplicationController
  before_action :authenticate
  helper_method :resource_letter

  def index
    @queue = Letter.queue
    fresh_when cache_key_with_flash(@queue)
  end

  def new
    @resource_letter = Letter.new
    fresh_when cache_key_with_flash(@resource_letter)
  end

  def create
    @resource_letter = Letter.new(letter_params)

    if @resource_letter.save
      redirect_to new_letter_path, notice: t('.created')
    else
      flash.now[:error] = t('.not_created')
      render 'new'
    end
  end

  def edit
    fresh_when cache_key_with_flash(resource_letter)
  end

  def update
    if resource_letter.update(letter_params)
      redirect_to letters_path, notice: t('.updated')
    else
      flash.now[:error] = t('.not_updated')
      render 'edit'
    end
  end

  def destroy
    if resource_letter.destroy
      redirect_to letters_path, notice: t('.destroyed')
    else
      redirect_to letters_path, error: t('.not_destroyed')
    end
  end

  private

  def cache_key_with_flash(record_or_relation)
    cache_key = if record_or_relation.respond_to?(:cache_key)
                  record_or_relation.cache_key
                else
                  record_or_relation.map(&:cache_key).join('/')
                end

    "#{cache_key}/#{flash.to_hash}"
  end

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
