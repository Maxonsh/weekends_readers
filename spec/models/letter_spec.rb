require 'rails_helper'

describe Letter do
  let(:content) { Faker::Lorem.sentences }

  context 'валидации' do
    #
    # `validate_uniqueness_of` использует первую существующую
    # запись в базе для проверки уникальности, или новую.
    # Новая нам не подходит так как у нас стоит ограничение
    # на поле `content` в базе, тест ломается.
    #
    # см. https://github.com/thoughtbot/shoulda-matchers/issues/194
    #
    let!(:letter) { described_class.create! content: content }

    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_uniqueness_of(:position) }
  end

  context '.queue' do
    let!(:letter1) { described_class.create! content: content }
    let!(:letter2) { described_class.create! content: content }

    it 'сортирует в порядке очереди' do
      expect(described_class.queue.first).to eq(letter2)
    end
  end

  context '.create' do
    let!(:letter) { described_class.create! content: content }

    it 'создаёт в статусе draft' do
      expect(letter).to be_draft
    end
  end

  context '.next_draft_by_queue' do
    before { described_class.delete_all }

    let!(:letter1) { described_class.create! status: 'draft', content: content }
    let!(:letter2) { described_class.create! status: 'draft', content: content }
    let!(:letter3) { described_class.create! status: 'sent', content: content }

    it 'возвращает письмо, которое нужно отправить' do
      expect(described_class.next_draft_by_queue).to eq(letter1)
    end
  end
end
