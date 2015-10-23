require 'rails_helper'

describe LetterController do
  render_views

  describe 'GET "index"' do
    it 'return http success' do
      xhr :get, :index, :format => :js
      expect(response).to be_success
    end
  end

  describe 'GET "new"' do
    it 'return http success' do
      xhr :get, :new, :format => :js
      expect(response).to be_success
    end
  end

  describe 'POST "create"' do
    it 'создалось письмо и произошел редирект на new' do
      expect(response).to redirect_to("/401.html")
    end
  end

  describe 'GET "edit"' do
    it 'return http success' do
      xhr :get, :edit, :format => :js
      expect(response).to be_success
    end
  end

  describe 'PUT "update"' do
    it 'поменялся контент письма и произошел редирект на index' do

    end
  end

  describe 'DELETE "destroy"' do
    it 'письмо удалилось и произошел редирект на index' do

    end
  end
end
