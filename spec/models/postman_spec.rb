require 'rails_helper'
require "#{Rails.root}/lib/postman"

describe Postman do
  let(:content) { Faker::Lorem.paragraph }
  let(:letter) { Letter.create! content: content }

  subject { described_class.deliver! letter }

  describe 'отправляет письмо' do
    it 'письмо отправлено' do
      expect { subject }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'адресат совпадает' do
      expect(subject.to).to eq ['staff@cifronomika.ru']
    end

    it 'тема совпадает' do
      expect(subject.subject).to eq('Что почитать на выходных')
    end

    it 'содержание совпадает' do
      expect(subject.body.encoded).to match(content)
    end
  end

  it 'статус отправленого письма изменен' do
    expect { subject }.to change { letter.reload.status_name }.from(:draft).to(:sent)
  end
end
