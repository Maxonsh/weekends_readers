require 'rails_helper'

describe Letter do
  let(:content) { Faker::Lorem.characters(30) }

  context 'валидации' do
    it { is_expected.to validate_presence_of(:content) }
    it { should validate_uniqueness_of(:position) }
  end

  context '.queue' do
    let!(:letter1) { described_class.create! content: content }
    let!(:letter2) { described_class.create! content: content }

    it 'скоуп сортирует в порядке очереди' do
      expect(described_class.queue.first).to eq(letter2)
    end
  end

  context 'status "draft"' do
    let!(:letter1) { described_class.create! content: content }

    it 'у созданого письма статус "draft"' do
      expect(described_class.last.status).to eq('draft')
    end
  end

  context '.for_send' do
    let!(:letter1) { described_class.create! status: 'draft', content: content }
    let!(:letter2) { described_class.create! status: 'draft', content: content }
    let!(:letter3) { described_class.create! status: 'send', content: content }

    it 'возвращает письмо, которое нужно отправить' do
      expect(described_class.for_send).to eq(letter1)
    end
  end
end
