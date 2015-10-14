require 'rails_helper'

describe ::Letter do
  context 'соответствующие валидации включены' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:position) }
  end

  it 'скоуп сортирует в порядке очереди' do
    let! (:letter1) { subject.create }
    let! (:letter2) { subject.create }

    expect(subject.queue.first).to eq(letter2)
  end

  it 'созданое письмо встало в начало очереди' do
    let! (:letter_last) { subject.create }

    expect(subject.last.position).to eq(letter_last.position)
  end

  it 'возвращает письмо, которое нужно отправить' do
    let! (:letter1) { subject.create status: 'draft' }
    let! (:letter2) { subject.create status: 'send' }

    expect(subject.for_send).to eq(letter1)
  end
end
