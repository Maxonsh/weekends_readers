require 'rails_helper'

describe LettersController do

  render_views

  describe 'GET #index' do
    it 'return http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'return http success' do
      get :new
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    let!(:content) { Faker::Lorem.sentences }
    subject { post :create, letter: { content: content } }

    it 'создалось письмо' do
      Letter.delete_all
      subject
      expect(Letter.find_by content: content).to be_present
    end

    it 'произошел редирект на new' do
      expect(subject).to redirect_to(new_letter_path)
    end
  end

  describe 'GET #edit' do
    it 'return http success' do
      get :edit
      expect(response).to be_success
    end
  end

  describe 'PUT #update' do
    let(:content1) { Faker::Lorem.sentences }
    let(:content2) { Faker::Lorem.sentences }
    let(:letter) { Letter.create! content: content1 }

    subject { put :update, letter: { content: content2 }, id: letter.id }

    it 'поменялся контент письма' do
      subject
      expect(letter.reload.content).to eq(content2)
    end

    it 'произошел редирект на index' do
      expect(subject).to redirect_to(letters_path)
    end
  end

  describe 'DELETE #destroy' do
    let(:content) { Faker::Lorem.sentences }
    let(:letter) { Letter.create! content: content }

    subject { delete :destroy, id: letter.id }

    it 'письмо удалилось' do
      subject
      expect(letter.reload).not_to be_present
    end

    it 'произошел редирект на index' do
      expect(subject).to redirect_to(letters_path)
    end
  end
end
