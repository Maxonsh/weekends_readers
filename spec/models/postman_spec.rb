require 'rails_helper'

describe Postman do
  let(:content) { Faker::Lorem.paragraph }
  let(:letter) { Letter.create! content: content }

  describe 'отправляет письмо' do
    let(:last_email) { ActionMailer::Base.deliveries.last }
    
    it 'письмо отправлено' do
      expect { described_class.deliver letter }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
    
    it 'адресат совпадает' do
      expect(last_email.to).to eq ['staff@cifronomika.ru']
    end 
    
    it 'тема совпадает' do
      expect(last_email.subject).to eq ['Что почитать на выходных']
    end  
    
    it 'содержание совпадает' do
      expect(last_email.body.raw_source).to eq(content)
    end   
  end  

  it 'статус отправленого письма изменен' do
    expect(letter.reload).to be_sent
  end
end
