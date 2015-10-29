require 'rails_helper'

describe Postman do
  let(:content) { Faker::Lorem.paragraph }
  let(:letter) { Letter.create! content: content }

  it 'отправляет письмо' do
    expect { described_class.deliver letter }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'статус отправленого письма изменен' do
    expect(letter.reload).to be_sent
  end
end
