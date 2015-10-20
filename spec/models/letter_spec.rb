require 'rails_helper'

describe Letter do
  context 'соответствующие валидации включены' do
    it { is_expected.to validate_presence_of(:content) }
    it { should validate_uniqueness_of(:position) }
  end

  context '.queue' do
    let! (:letter1) { described_class.create }
    let! (:letter2) { described_class.create }

    it 'скоуп сортирует в порядке очереди' do
      expect(described_class.queue.first).to eq(letter2)
    end
  end

  context '.draft' do
    let! (:letter1) { described_class.create }

    it 'скоуп возвращает письма с статусом "draft"' do
      expect(described_class.draft.last).to eq(letter1)
    end
  end

  context 'status "draft"' do
    let! (:letter1) { described_class.create }

    it 'у созданого письма статус "draft"' do
      expect(described_class.last.status).to eq(letter1.status)
    end
  end

  context '.for_send' do
    let! (:letter1) { described_class.create status: 'draft' }
    let! (:letter2) { described_class.create status: 'draft' }
    let! (:letter3) { described_class.create status: 'send' }

    it 'возвращает письмо, которое нужно отправить' do
      expect(described_class.for_send).to eq(letter1)
    end
  end
end
