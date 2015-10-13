require 'rails_helper'

describe ::Letter do
  context 'соответствующие валидации включены' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:position) }
  end

  context 'скоуп сортирует в порядке очереди' do

  end

  context 'созданое письмо встало в начало очереди' do

  end

  context 'возвращает письмо, которое нужно отправить' do

  end
end
